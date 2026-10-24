//
//  Coordinator.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 14/10/26.
//

import SwiftUI
import UIKit

@MainActor
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var children: [Coordinator] { get set }
    var rootViewController: UIViewController? { get set }

    func start()
}

extension Coordinator {
    func addChild(_ coordinator: Coordinator) {
        guard !children.contains(where: { $0 === coordinator }) else { return }
        children.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator) {
        let before = children.count
        children.removeAll { $0 === coordinator }
        assert(
            children.count < before,
            "removeChild: \(type(of: coordinator)) was never registered as a child — identity match failed, so it is still retained and leaking."
        )
    }
    
    func reconcileChildren() {
        for child in children {
            child.reconcileChildren()
        }

        let onStack = navigationController.viewControllers
        children.removeAll { child in
            guard let root = child.rootViewController else { return true }
            return !onStack.contains(root)
        }
    }
}

// MARK: - Navigation

extension Coordinator {
    
    private func trackIfFirst(_ viewController: UIViewController) {
        guard rootViewController == nil else { return }
        rootViewController = viewController
    }

    // MARK: Push

    func push(_ viewController: UIViewController, animated: Bool = true) {
        trackIfFirst(viewController)
        navigationController.pushViewController(viewController, animated: animated)
    }

    /// Pushes a SwiftUI screen onto the same stack as the UIKit ones.
    func push(_ view: some View, animated: Bool = true) {
        push(UIHostingController(rootView: view), animated: animated)
    }

    // MARK: Pop

    func pop(animated: Bool = true) {
        assert(
            navigationController.viewControllers.count > 1,
            "pop: already at the root of this navigation controller — nothing to pop."
        )
        navigationController.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }

    func pop(to viewController: UIViewController, animated: Bool = true) {
        assert(
            navigationController.viewControllers.contains(viewController),
            "pop(to:): \(type(of: viewController)) is not on this navigation stack, so nothing will happen."
        )
        navigationController.popToViewController(viewController, animated: animated)
    }

    /// Pops back to the nearest screen of this type — the usual case, since a
    /// coordinator rarely still holds the instance it pushed. Returns false
    /// when no such screen is on the stack, leaving it untouched.
    @discardableResult
    func pop<T: UIViewController>(to type: T.Type, animated: Bool = true) -> Bool {
        guard let target = navigationController.viewControllers.last(where: { $0 is T }) else {
            return false
        }
        navigationController.popToViewController(target, animated: animated)
        return true
    }

    // MARK: Replace the stack

    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = false) {
        viewControllers.first.map(trackIfFirst)
        navigationController.setViewControllers(viewControllers, animated: animated)
    }

    /// Replaces the whole stack with one screen. How a flow usually starts,
    /// since the screen before it must not stay reachable by back.
    func setRoot(_ viewController: UIViewController, animated: Bool = false) {
        setViewControllers([viewController], animated: animated)
    }

    func setRoot(_ view: some View, animated: Bool = false) {
        setRoot(UIHostingController(rootView: view), animated: animated)
    }

    // MARK: UIKIT Bottomsheet
    func present(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.present(viewController, animated: animated)
    }

    //MARK: - SWIFTUI Bottomsheet
    func present(_ view: some View, animated: Bool = true) {
        present(UIHostingController(rootView: view), animated: animated)
    }

    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: animated)
    }
}
