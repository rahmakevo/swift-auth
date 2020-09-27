//
//  UILabel+Style.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

extension UILabel {
    func styleWith(font: UIFont, textColor color: UIColor) {
        self.font = font
        textColor = color
    }

    func styleAsHeadline() {
        styleWith(font: .headline, textColor: .textPrimary)
    }

    func styleAsSubheadline() {
        styleWith(font: .subheadline, textColor: .textPrimary)
    }

    func styleAsTitle() {
        styleWith(font: .title, textColor: .textPrimary)
    }

    func styleAsPrimaryText() {
        styleWith(font: .primaryText, textColor: .textPrimary)
    }

    func styleAsSecondaryText() {
        styleWith(font: .secondaryText, textColor: .textPrimary)
    }

    func styleAsMainHeader() {
        styleWith(font: .mainHeader, textColor: .textPrimary)
    }

    func styleAsMainSubheader() {
        styleWith(font: .secondaryHeader, textColor: .textPrimary)
    }

    func styleAsSecondaryHeader() {
        styleWith(font: .secondaryHeader, textColor: .midGreyColor)
    }
}
