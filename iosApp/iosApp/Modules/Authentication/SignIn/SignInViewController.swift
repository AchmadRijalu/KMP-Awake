//
//  SignInViewController.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 14/10/26.
//

import UIKit
import SwiftUI
import AraxUI

final class SignInViewController: UIViewController {
    weak var coordinator: AuthCoordinating?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func constructContent() {
        let hostingController = SignInHostingController(coodinating: coordinator)
        embedViewToViewController(hostingController, in: view)
    }
    
}

class SignInHostingController: UIHostingController<SignInContentView> {
     init(coodinating: AuthCoordinating?) {
        super.init(rootView: SignInContentView(coordinator: coodinating))
    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ViewControllerPreview {
        SignInViewController()
    }
}
