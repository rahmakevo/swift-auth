//
//  MainViewCoordinator.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation
import UIKit

final class MainViewCoordinator: Coordinator {
    override func start() {
        let vc = MainViewController.instantiate()
        vc.goToHome = goToHome
        push(viewController: vc)
    }
    func goToHome() {
        let coordinator = HomeViewCoordinator(parentCoordinator: self)
        coordinator.start()
    }
}
