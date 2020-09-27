//
//  String+Localization.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    public func localized(parameter: Int) -> String {
        let formatString = localized
        let resultString = String.localizedStringWithFormat(formatString, parameter)
        return resultString
    }

    public func localized(parameter: String) -> String {
        let formatString = localized
        let resultString = String.localizedStringWithFormat(formatString, parameter)
        return resultString
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
