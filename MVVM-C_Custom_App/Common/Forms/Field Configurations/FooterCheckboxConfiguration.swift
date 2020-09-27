//
//  FooterCheckboxConfiguration.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

struct FooterCheckboxConfiguration: FieldConfiguration {
    var attributedText: NSAttributedString?
    var rules: [ValidationRule] = []
    var state = InputState(value: false)
    var isSelectionEntry: Bool = false
    var validatesOnKeypress: Bool = false
}
