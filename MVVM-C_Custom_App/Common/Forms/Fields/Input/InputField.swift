//
//  InputField.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

class InputField: ConfigurableFormField {
    let model: FormFieldModel<String>
    let reuseIdentifier: String = "inputField"
    let nibName: String = "InputFieldView"
    let tag: Int

    init(model: FormFieldModel<String>, tag: Int) {
        self.model = model
        self.tag = tag
    }

    func configure(_ cell: UITableViewCell, indexPath: IndexPath, sender: FormViewController? = nil) -> UITableViewCell {
        guard let c = cell as? InputFieldView else { return cell }
        c.configure(with: model, delegate: sender, tag: tag)
        return c
    }

    func preferredHeight(for indexPath: IndexPath) -> CGFloat {
        guard model.state.isValid else { return 74.0 }
        return 48.0
    }
}
