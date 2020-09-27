//
//  CloseableViewController.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

protocol CloseableViewController {

    func applyCloseButtonStyling(action: Selector, image: String)
}

extension CloseableViewController where Self: UIViewController {

    func applyCloseButtonStyling(action: Selector, image: String) {
        let backImage = UIImage(named: image)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: action, for: .touchUpInside)
        let backItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backItem
    }
}
