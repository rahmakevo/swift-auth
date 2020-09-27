//
//  StylableButton.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

protocol StylableButton {
    func applyButtonStyling()
}

extension StylableButton where Self: UIButton {
    func applyButtonStyling() {
        // implement this function to provide custom styling
    }
}
