//
//  Injection.swift
//  iosApp
//
//  Created by Achmad Rijalu A on 14/10/26.
//

@MainActor
final class Injection {
    func provideBrowseViewModel() -> BrowseViewModel {
        BrowseViewModel()
    }

    func provideCoffeeDetailViewModel(coffeeID: String) -> CoffeeDetailViewModel {
        CoffeeDetailViewModel(coffeeID: coffeeID)
    }
}
