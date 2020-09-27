//
//  HomeViewCoordinator.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation
import  UIKit

final class HomeViewCoordinator: Coordinator {
    override func start() {
        let model = HomeViewModel()
        let viewController = HomeViewController()
        viewController.viewModel = model
        
        let navC = UINavigationController(rootViewController: viewController)
        navC.modalPresentationStyle = .fullScreen
        present(viewController: navC)
        navigationController = navC
    }
}
