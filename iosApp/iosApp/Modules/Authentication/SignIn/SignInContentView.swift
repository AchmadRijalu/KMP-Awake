//
//  SignInContentView.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 21/10/26.
//

import SwiftUI
import AraxUI

struct SignInContentView: View {
    weak var coordinator: AuthCoordinating?

    var body: some View {
        ZStack {
            Color(hex: "F1F0F2")
                .ignoresSafeArea()
            VStack {
                Text("Masukkan Nomor Telepon untuk Masuk")
                    .font(.poppins(.medium, size: 14))
            }
        }
    }
}
