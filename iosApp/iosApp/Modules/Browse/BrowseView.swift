//
//  BrowseView.swift
//  iosApp
//
//  Created by Achmad Rijalu A on 08/10/26.
//

import SwiftUI

struct BrowseView: View {
    @ObservedObject var viewModel: BrowseViewModel

    weak var coordinator: BrowseCoordinating?

    var body: some View {
        VStack {

        }
    }
}

#Preview {
    BrowseView(viewModel: BrowseViewModel(), coordinator: nil)
}
