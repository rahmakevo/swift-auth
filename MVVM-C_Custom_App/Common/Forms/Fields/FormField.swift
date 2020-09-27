//
//  FormField.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

protocol FormField: class {
    var reuseIdentifier: String { get }
    var nibName: String { get }
    var tag: Int { get }

    @discardableResult
    func validate() -> Bool
    func reset()
    func configure(_ cell: UITableViewCell, indexPath: IndexPath, sender: FormViewController?) -> UITableViewCell
    func preferredHeight(for indexPath: IndexPath) -> CGFloat
}

extension FormField {
    @discardableResult
    func validate() -> Bool {
        return true
    }

    func reset() {
        // do nothing
    }

    func configure(_ cell: UITableViewCell, indexPath: IndexPath, sender: FormViewController? = nil) -> UITableViewCell {
        return cell
    }

    func preferredHeight(for indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
