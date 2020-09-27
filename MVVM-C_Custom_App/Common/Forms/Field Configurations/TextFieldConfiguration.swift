//
//  TextFieldConfiguration.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

struct TextFieldConfiguration: FieldConfiguration {
    var textColor = UIColor.textPrimary
    var placeholder: String = ""
    var textPlaceholderColor = UIColor.textPrimary
    var keyboardType: UIKeyboardType = .default
    var autocorrectionType: UITextAutocorrectionType = .no
    var smartQuotesType: UITextSmartQuotesType = .no
    var smartDashesType: UITextSmartDashesType = .no
    var smartInsertDeleteType: UITextSmartInsertDeleteType = .no
    var surfaceBackgroundColor: UIColor?
    var tintColor: UIColor?
    var textAlignment: NSTextAlignment = .left
    var needsWiderLabel: Bool = false
    var isSecureTextEntry: Bool = false
    var isSelectionEntry: Bool = false
    var validatesOnKeypress: Bool = false
}
