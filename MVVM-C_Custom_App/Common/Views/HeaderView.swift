//
//  HeaderView.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIView {

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var topStackConstraint: NSLayoutConstraint!
    @IBOutlet private weak var leadingStackConstraint: NSLayoutConstraint!
    @IBOutlet private weak var trailingStackConstraint: NSLayoutConstraint!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!

    var isConfigured = false

    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.styleAsHeadline()
        subtitleLabel.styleAsSecondaryText()
    }

    public func configure(title: String? = nil, subtitle: String? = nil, width: CGFloat = 0.0) {
        isConfigured = true
        widthConstraint.constant = width - leadingStackConstraint.constant - trailingStackConstraint.constant

        if let title = title {
            let spacedText = NSMutableAttributedString(string: title)
            spacedText.addLineSpacingToFullRange(0.36, alignment: .left)
            titleLabel.attributedText = spacedText
        } else {
            titleLabel.removeFromSuperview()
            stackView.removeArrangedSubview(titleLabel)
        }

        if let subtitle = subtitle {
            let spacedText = NSMutableAttributedString(string: subtitle)
            spacedText.addLineSpacingToFullRange(-0.24, alignment: .left, lineHeight: 20.0 / 15.0)
            subtitleLabel.attributedText = spacedText
        } else {
            subtitleLabel.removeFromSuperview()
            stackView.removeArrangedSubview(subtitleLabel)
        }
    }

    public func styleAsScreenTitle() {
        topStackConstraint.constant = 52.0
        layoutIfNeeded()
    }

}
