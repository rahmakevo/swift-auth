//
//  FormViewModel.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

typealias ViewModelCallback = (_ error: Error?) -> Void

class FormViewModel {
    /// Use it when you have only one section
    internal var updateCallback: ViewModelCallback?
    var modelDidUpdate: () -> Void = { print("modelDidUpdate is not overridden") }
    var redrawRow: (IndexPath) -> Void = { _ in print("redrawRow selectionCalback is not overridden") }
    var redrawSection: (Int) -> Void = { _ in print("redrawSection selectionCalback is not overridden") }
    var actionButtonAccessibility: (Bool) -> Void = {_ in print("actionButtonAccessibilityd is not overridden") }
    var didBackButtonTap: () -> Void = { print("backAction is not overridden") }

    var sections: [FormSection]  =  []

    func subscribe(with updateCallback: ViewModelCallback?) {
        self.updateCallback = updateCallback
    }

    func item(at indexPath: IndexPath) -> FormField? {
        guard indexPath.section < sections.count, indexPath.row < sections[indexPath.section].cells.count else { return nil }
        return sections[indexPath.section].cells[indexPath.row]
    }

    func indexPath(for tag: Int) -> IndexPath? {
        guard tag >= 0 else { return nil }
        for (sectionId, section) in sections.enumerated() {
            for (row, item) in section.cells.enumerated() where item.tag == tag {
                return IndexPath(row: row, section: sectionId)
            }
        }
        return nil
    }

    func item(for tag: Int) -> FormField? {
        guard tag >= 0 else { return nil }
        for section in sections {
            for item in section.cells where item.tag == tag {
                return item
            }
        }
        return nil
    }

    @discardableResult
    func validateInput() -> Bool {
        var isValid = true
        for section in sections {
            for cell in section.cells {
                let valid = cell.validate()
                isValid = isValid && valid
            }
        }
        return isValid
    }

    func resetInput() {
        for section in sections {
            for cell in section.cells {
                cell.reset()
            }
        }
        updateCallback?(nil)
    }

    func submit() {
        // override this for custom behavior
    }

    func submitSecondaryButton() {
        // override this for custom behavior
    }

    deinit {
        print("----- \(self) deinit")
    }
}
