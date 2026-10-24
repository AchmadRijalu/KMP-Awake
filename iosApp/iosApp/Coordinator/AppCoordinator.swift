//
//  AppCoordinator.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 10/10/26.
//

import UIKit

@MainActor
protocol AppCoordinating: AnyObject {
    func showAuthentication()
    func showMain()
}

@MainActor
final class AppCoordinator: NSObject, Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
    weak var rootViewController: UIViewController?

    private let injection: Injection

    init(navigationController: UINavigationController, injection: Injection) {
        self.navigationController = navigationController
        self.injection = injection
        super.init()
    }

    func start() {
        navigationController.delegate = self
        showAuthentication()
    }
}

extension AppCoordinator: AppCoordinating {
    func showAuthentication() {
        children.removeAll()
        let auth = AuthCoordinator(
            navigationController: navigationController,
            injection: injection,
            parent: self
        )
        addChild(auth)
        auth.start()
    }

    func showMain() {
        children.removeAll()
        let browse = BrowseCoordinator(
            navigationController: navigationController,
            injection: injection
        )
        addChild(browse)
        browse.start()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        reconcileChildren()
    }
}
