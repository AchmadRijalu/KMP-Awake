//
//  OnboardingContentView.swift
//  iosApp
//
//  Created by Achmad Rijalu A on 14/10/26.
//

import SwiftUI
import AraxUI

struct OnboardingContentView: View {
    weak var coordinator: AuthCoordinating?

    var body: some View {
        ZStack {
            Color(hex: "F1F0F2")
                .ignoresSafeArea()
            VStack {
                Spacer()
                intro
                Spacer()
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            bottomContainer
        }
    }
    
    private var intro: some View {
        VStack(spacing: 12) {
            Image(.imageOnboarding)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            Text("We've a Great Coffee")
                .font(.poppins(.bold ,size: 24))
                .foregroundColor(Color(hex: "050713"))
            
            Text("Your favorite coffee is just a tap away. Order ahead and skip the line!")
                .font(.poppins(size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex: "#050713"))

        }
        .padding(.horizontal, 42)
    }
    
    private var bottomContainer: some View {
        VStack(spacing: 20) {
            AraxButton(backgroundColor: .init(hex: "#e81513"), foregroundColor: .white) {
                coordinator?.showSignIn()
            } content: {
                Text("Masuk")
                    .font(.poppins(size: 14))
            }
            Button {
                coordinator?.showMain()
            } label: {
                Text("Lewati Tahap ini")
                    .font(.poppins(size: 14))
                    .foregroundColor(Color(hex: "050713"))
            }

        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(
            Color.white
                .baseTopRoundedCorner()
                .ignoresSafeArea(edges: .bottom)
        )
    }
}

#Preview {
    OnboardingContentView(coordinator: nil)
}
