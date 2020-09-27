//
//  InputFieldView.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

class InputFieldView: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var inputField: UITextField!
    @IBOutlet private weak var divider: UIView!
    @IBOutlet private weak var errorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
    }

    func configure(with model: FormFieldModel<String>, delegate: UITextFieldDelegate?, tag: Int) {
        inputField.tag = tag
        inputField.delegate = delegate

        label.text = model.label

        errorLabel.isHidden = model.state.isValid
        divider.backgroundColor = model.state.isValid ? .lightGray : .colorPrimary
        errorLabel.textColor = .colorPrimary
        errorLabel.text = model.state.errorMessages.first

        guard let configuration = model.inputFieldConfiguration as? TextFieldConfiguration else { return }
        setupInputField(from: configuration)
    }

    private func setupInputField(from configuration: TextFieldConfiguration) {
        inputField.placeholder = configuration.placeholder
        inputField.keyboardType = configuration.keyboardType
        inputField.textAlignment = configuration.textAlignment
        inputField.isSecureTextEntry = configuration.isSecureTextEntry
        inputField.autocorrectionType = configuration.autocorrectionType
        inputField.smartQuotesType = configuration.smartQuotesType
        inputField.smartDashesType = configuration.smartDashesType
        inputField.smartInsertDeleteType = configuration.smartInsertDeleteType
        inputField.tintColor = configuration.tintColor
    }

}
