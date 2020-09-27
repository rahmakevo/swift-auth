//
//  ActionToolbarView.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

class ActionToolbarView: UIView {

    var actionButtonTapped: () -> Void = { print("actionButtonTapped not overridden") }
    var secondaryButtonTapped: () -> Void = { print("secondaryButtonTapped not overridden") }

    private let hasSecondaryButton: Bool

    lazy var actionButton: BrandedActionButton = {
        let button = BrandedActionButton()
        button.layer.cornerRadius = 4.0
        button.backgroundColor = .midGreyColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapActionButton(_:)), for: .touchUpInside)
        return button
    }()

    lazy var secondaryButton: BrandedActionButton = {
        let button = BrandedActionButton()
        button.layer.cornerRadius = 4.0
        button.backgroundColor = .midGreyColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSecondaryButton(_:)), for: .touchUpInside)
        return button
    }()

    @objc private func didTapActionButton(_ sender: BrandedActionButton) {
        actionButtonTapped()
    }

    @objc private func didTapSecondaryButton(_ sender: BrandedActionButton) {
        secondaryButtonTapped()
    }

    init(frame: CGRect = .zero, hasSecondaryButton: Bool = false) {
        self.hasSecondaryButton = hasSecondaryButton
        super.init(frame: frame)
        commonSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .surfacePrimary

        addSubview(actionButton)

        if hasSecondaryButton {
            secondaryButton.isHidden = false
            secondaryButton.alpha = 1.0
            addSubview(secondaryButton)

            addConstraints([
                actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                actionButton.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
                actionButton.heightAnchor.constraint(equalToConstant: 48.0),
                actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
                actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),

                actionButton.bottomAnchor.constraint(equalTo: secondaryButton.topAnchor, constant: -16.0),

                secondaryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                secondaryButton.heightAnchor.constraint(equalToConstant: 48.0),
                safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: secondaryButton.bottomAnchor, constant: 10.0),
                secondaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
                secondaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0)
            ])
        } else {
            secondaryButton.isHidden = true
            secondaryButton.alpha = 0.0

            addConstraints([
                actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                actionButton.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
                actionButton.heightAnchor.constraint(equalToConstant: 48.0),
                safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 10.0),
                actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
                actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0)
            ])
        }
    }
}
