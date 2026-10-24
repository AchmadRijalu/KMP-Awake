//
//  SceneDelegate.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 14/10/26.
//

import UIKit

/// Owns the window and the root coordinator for one scene. The coordinator is
/// held here because nothing above it retains it, and releasing it would tear
/// down every child flow.
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(
            navigationController: navigationController,
            injection: Injection()
        )

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        self.appCoordinator = coordinator

        window.makeKeyAndVisible()
        coordinator.start()
    }
}
