//
//  BrandedActionButton.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

class BrandedActionButton: UIButton, StylableButton {
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .black : .gray
            applyButtonStyling()
            setNeedsDisplay()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commonSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }

    private func commonSetup() {
        backgroundColor = .gray
        titleLabel?.font = UIFont.boldFont(size: 15.0)
        applyButtonStyling()
    }
}
