//
//  OnboardingViewController.swift
//  iosApp
//
//  Created by Achmad Rijalu  A on 14/10/26.
//

import UIKit
import AraxUI
import SwiftUI

class OnboardingViewController: UIViewController {
    weak var authCoordinator: AuthCoordinating?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constructContent()
    }
    
    func constructContent() {
        let hostingController = OnboardingHostingController(coordinator: authCoordinator)
        embedViewToViewController(hostingController, in: view)
    }
}

class OnboardingHostingController: UIHostingController<OnboardingContentView> {
    
    init(coordinator: AuthCoordinating?) {
        super.init(rootView: OnboardingContentView(coordinator: coordinator))
    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ViewControllerPreview {
        OnboardingViewController()
    }
}
