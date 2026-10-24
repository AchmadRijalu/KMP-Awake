//
//  CoffeeDetailViewModel.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 08/10/26.
//

import SwiftUI
import Combine

@MainActor
class CoffeeDetailViewModel: ObservableObject {
    let coffeeID: String

    init(coffeeID: String) {
        self.coffeeID = coffeeID
    }
}
