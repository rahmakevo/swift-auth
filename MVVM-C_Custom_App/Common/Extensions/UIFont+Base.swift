//
//  UIFont+Base.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

extension UIFont {
    public static func blackFont(size: CGFloat = systemFontSize) -> UIFont {
        return systemFont(ofSize: size, weight: .heavy)
    }

    public static func boldFont(size: CGFloat = systemFontSize) -> UIFont {
        return systemFont(ofSize: size, weight: .bold)
    }

    public static func semiboldFont(size: CGFloat = systemFontSize) -> UIFont {
        return systemFont(ofSize: size, weight: .semibold)
    }

    public static func mediumFont(size: CGFloat = systemFontSize) -> UIFont {
        return systemFont(ofSize: size, weight: .medium)
    }

    public static func regularFont(size: CGFloat = systemFontSize) -> UIFont {
        return systemFont(ofSize: size, weight: .regular)
    }

    class var headline: UIFont {
        return blackFont(size: 28.0)
    }

    class var subheadline: UIFont {
        return blackFont(size: 22.0)
    }

    class var title: UIFont {
        return blackFont(size: 20.0)
    }

    class var primaryText: UIFont {
        return regularFont(size: 17.0)
    }

    class var secondaryText: UIFont {
        return regularFont(size: 15.0)
    }

    class var mainHeader: UIFont {
        return regularFont(size: 20.0)
    }

    class var secondaryHeader: UIFont {
        return regularFont(size: 14.0)
    }
}
