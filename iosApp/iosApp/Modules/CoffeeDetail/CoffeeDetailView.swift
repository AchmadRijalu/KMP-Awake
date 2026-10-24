//
//  CoffeeDetailView.swift
//  iosApp
//
//  Created by Achmad Rijalu A on 08/10/26.
//

import SwiftUI

struct CoffeeDetailView: View {
    @ObservedObject var viewModel: CoffeeDetailViewModel

    var body: some View {

    }
}

#Preview {
    CoffeeDetailView(viewModel: CoffeeDetailViewModel(coffeeID: "preview"))
}
