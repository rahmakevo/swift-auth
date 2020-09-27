//
//  ConfigurableFormField.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

protocol ConfigurableFormField: FormField {
    associatedtype Model
    var model: FormFieldModel<Model> { get }
}

extension ConfigurableFormField {
    func reset() {
        model.state.reset()
    }

    @discardableResult
    func validate() -> Bool {
        model.state.errorMessages = []
        model.state.isValid = model.rules.allSatisfy { validationRule in
            var isValid = true
            if let strVal = model.state.value as? String {
                isValid = validationRule.apply(to: strVal)
            } else if let boolVal = model.state.value as? Bool {
                isValid = validationRule.apply(to: boolVal)
            }
            if !isValid {
                model.state.errorMessages.append(validationRule.invalidMessage(forLabel: model.label))
            }
            return isValid
        }
        return model.state.isValid
    }
}
