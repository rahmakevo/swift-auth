//
//  UIColor+Base.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

extension UIColor {
    @nonobjc class var colorPrimary: UIColor {
        return UIColor(named: "colorPrimary") ?? UIColor.black
    }

    @nonobjc class var surfacePrimary: UIColor {
        return UIColor(named: "surfacePrimary") ?? UIColor.white
    }

    @nonobjc class var textPrimary: UIColor {
        return UIColor(named: "textPrimary") ?? UIColor.darkText
    }

    @nonobjc class var midGreyColor: UIColor {
        return UIColor(named: "borderColor") ?? UIColor(red: 192.0 / 255.0, green: 192.0 / 255.0, blue: 192.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var backgroundColor: UIColor {
        return UIColor(named: "backgroundColor") ?? UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    }
}
