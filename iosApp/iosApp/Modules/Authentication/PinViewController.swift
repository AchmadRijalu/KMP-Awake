//
//  PinViewController.swift
//  iosApp
//
//  Created by Achmad Rijalu A on 14/10/26.
//

import UIKit

final class PinViewController: UIViewController {
    weak var coordinator: AuthCoordinating?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    func verify() {
        coordinator?.showMain()
    }
}
