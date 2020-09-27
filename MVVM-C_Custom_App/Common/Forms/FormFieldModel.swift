//
//  FormFieldModel.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

struct FormFieldModel<T> {
    var label: String = ""
    var attributedLabel: NSMutableAttributedString?
    var inputFieldConfiguration: FieldConfiguration?
    var rules: [ValidationRule] = []
    var format: (String?) -> String? = { return $0 }
    var state: InputState<T>
    var isVisible = true
}

protocol FieldConfiguration {
    var isSelectionEntry: Bool { get }
    var validatesOnKeypress: Bool { get }
}
