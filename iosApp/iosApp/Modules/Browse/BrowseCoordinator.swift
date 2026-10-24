//
//  BrowseCoordinator.swift
//  iosApp
//
//  Created by Achmad Rijalu A on 14/10/26.
//

import UIKit

@MainActor
protocol BrowseCoordinating: AnyObject {
    func showCoffeeDetail(id: String)
}

@MainActor
final class BrowseCoordinator: Coordinator {
    let navigationController: UINavigationController
    var children: [Coordinator] = []
    weak var rootViewController: UIViewController?

    private let injection: Injection

    init(navigationController: UINavigationController, injection: Injection) {
        self.navigationController = navigationController
        self.injection = injection
    }

    func start() {
        setRoot(
            BrowseView(
                viewModel: injection.provideBrowseViewModel(),
                coordinator: self
            )
        )
    }
}

extension BrowseCoordinator: BrowseCoordinating {
    func showCoffeeDetail(id: String) {
        push(
            CoffeeDetailView(
                viewModel: injection.provideCoffeeDetailViewModel(coffeeID: id)
            )
        )
    }
}
