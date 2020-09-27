//
//  InputState.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

final class InputState<T> {
    var value: T
    var isValid: Bool = true
    var errorMessages: [String] = []
    var selectedTextRange: UITextRange?

    private var initialValue: T

    init(value: T) {
        initialValue = value
        self.value = value
    }

    func reset() {
        value = initialValue
        isValid = true
        errorMessages = []
        selectedTextRange = nil
    }

}
