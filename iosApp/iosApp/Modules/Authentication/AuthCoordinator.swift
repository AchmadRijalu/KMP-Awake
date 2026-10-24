//
//  AuthCoordinator.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 14/10/26.
//

import UIKit


@MainActor
protocol AuthCoordinating: AnyObject {
    func showSignIn()
    func showPin()
    func showMain()
}

@MainActor
final class AuthCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
    weak var rootViewController: UIViewController?

    private let injection: Injection
    private weak var parent: AppCoordinating?

    init(
        navigationController: UINavigationController,
        injection: Injection,
        parent: AppCoordinating?
    ) {
        self.navigationController = navigationController
        self.injection = injection
        self.parent = parent
    }

    func start() {
        let onboarding = OnboardingViewController()
        onboarding.authCoordinator = self
        setRoot(onboarding)
    }
}

extension AuthCoordinator: AuthCoordinating {
    func showSignIn() {
        let signIn = SignInViewController()
        signIn.coordinator = self
        push(signIn)
    }

    func showPin() {
        let pin = PinViewController()
        pin.coordinator = self
        push(pin)
    }

    func showMain() {
        parent?.showMain()
    }
}
