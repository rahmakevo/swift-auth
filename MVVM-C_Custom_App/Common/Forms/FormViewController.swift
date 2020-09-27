//
//  FormViewController.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit
import CoreLocation

class FormViewController: TableBackedViewController {

    var closeAction: (() -> Void) = { print("closeAction not overridden") }
    var selectItem: (Int, String?, @escaping (String?) -> Void) -> Void = { _, _, _ in print("selectItem not overridden") }
    var selectedInternalURL: (URL) -> Void = { _ in print("selectedInternalURL not overridden") }
    var onRowSelected: (IndexPath) -> Void = { _ in print("onRowSelected is not overridden") }

    var viewModel: FormViewModel! {
        didSet {
            viewModel.actionButtonAccessibility = self.actionButtonAccessibility
        }
    }

    var activeTextField: UITextField?
    var activeTextFieldIndexPath: IndexPath?
    var activeTextFieldModel: FormFieldModel<String>?

    public var height: CGFloat = 0.0

    private(set) var hasActionButton: Bool = false
    private(set) var hasSecondaryButton: Bool = false

    private var actionToolbarBottomConstraint: NSLayoutConstraint!

    @objc private func didTapActionButton(_ sender: BrandedActionButton) {
        displayLoadingView()
        sender.isEnabled = false
        viewModel.submit()
    }

    lazy var actionToolbar = ActionToolbarView(hasSecondaryButton: hasSecondaryButton)

    public lazy var headerView: HeaderView = {
        let headerView: HeaderView = .fromNib()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = nil
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(true, animated: false)

        configureCells()
        actionToolbar.actionButton.addTarget(self, action: #selector(didTapActionButton(_:)), for: .touchUpInside)
        actionToolbar.actionButton.setTitle("submit".localized, for: .normal)
        configureActionToolbar()

        actionToolbar.secondaryButtonTapped = viewModel.submitSecondaryButton

        viewModel.subscribe { [weak self] err in
            MainThread.run { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.hideLoadingView()
                strongSelf.actionToolbar.actionButton.isEnabled = true
                if let error = err {
                    strongSelf.handle(error)
                    strongSelf.updateUI()
                    return
                }
                strongSelf.updateUI()
            }
        }
    }

    internal func updateUI() {
        tableView.reloadData()
    }

    internal func handle(_ error: Error) {
        AppMessage.shared.display(error.localizedDescription)
    }

    func actionButtonAccessibility(isEnabled: Bool) {
        actionToolbar.actionButton.isEnabled = isEnabled
    }

    private func configureCells() {
        var knownIdentifiers: [String] = []
        for section in viewModel.sections {
            for item in section.cells {
                guard !knownIdentifiers.contains(item.reuseIdentifier) else { continue }
                let nib = UINib(nibName: item.nibName, bundle: .main)
                tableView.register(nib, forCellReuseIdentifier: item.reuseIdentifier)
                knownIdentifiers.append(item.reuseIdentifier)
            }
        }
    }

    private func configureActionToolbar() {
        guard hasActionButton else { return }
        view.addSubview(actionToolbar)
        actionToolbarBottomConstraint = view.bottomAnchor.constraint(equalTo: actionToolbar.bottomAnchor, constant: 10)
        view.addConstraints([
            actionToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            actionToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionToolbarBottomConstraint
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        startMonitoringKeyboard()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard let headerView = tableView.tableHeaderView as? HeaderView, headerView.isConfigured else { return }
        setupHeaderView(headerView)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopMonitoringKeyboard()
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        guard parent == nil else { return }
        closeAction()
    }

    override func animateKeyboardHeight(to height: CGFloat) {
        let actionToolbarHeight = hasActionButton ? actionToolbar.frame.height : 0
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: height + 20 + actionToolbarHeight, right: 0.0)
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
        if hasActionButton {
            actionToolbarBottomConstraint.constant = height
            view.layoutIfNeeded()
        }
    }

    private func setupHeaderView(_ headerView: UIView) {
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var headerFrame = headerView.frame

        guard height != headerView.frame.size.height else { return }
        headerFrame.size.height = height
        headerView.frame = headerFrame
        tableView.tableHeaderView = headerView
    }

    private func setupTableHeaderView(withSection section: FormSection) -> UIView {
        let label = UILabel()
        label.text = section.title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        section.titleStyle.configure(label)

        let sublabel = UILabel()
        sublabel.text = section.subtitle
        sublabel.translatesAutoresizingMaskIntoConstraints = false
        section.subtitleStyle.configure(sublabel)

        let headerView = UIView()
        headerView.addSubview(label)
        headerView.addSubview(sublabel)

        headerView.addConstraints([
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16.0),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24.0),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24.0),
            sublabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20.0),
            sublabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24.0)
        ])
        return headerView
    }

    func focusOnInput() {
//        inputViews.forEach { $0.focusOnInputField() }
    }

    func unfocusInput() {
//        inputViews.forEach { $0.unfocusInputField() }
    }

    func cleanup() {
        closeAction = { print("closeAction unbound") }
        selectItem = { _, _, _ in print("selectItem unbound") }
        selectedInternalURL = { _ in print("selectedInternalURL unbound") }
        viewModel = nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel?.sections[section].cells.count ?? 0
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cellType = viewModel?.item(at: indexPath) else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath)
            return cellType.configure(cell, indexPath: indexPath, sender: self)
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            guard let cellType = viewModel?.item(at: indexPath) else {
                return view.bounds.height - headerView.bounds.height
            }
            return cellType.preferredHeight(for: indexPath)
        }

        func numberOfSections(in tableView: UITableView) -> Int {
            return viewModel.sections.count
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard let section = viewModel?.sections[section] else { return nil }
            return setupTableHeaderView(withSection: section)
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            guard viewModel?.sections[section].title != nil else { return 0 }
            return 48
        }

        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 0
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            onRowSelected(indexPath)
        }

        func redrawRow(indexPath: IndexPath) {
            tableView.reloadRows(at: [indexPath], with: .fade)
        }

        func redrawSection(section: Int) {
            tableView.reloadSections(IndexSet([section]), with: .fade)
        }

        private func textFieldDidUpdate(_ updatedText: String?, for indexPath: IndexPath) {
            guard updatedText != nil, let item = viewModel?.item(at: indexPath), let model = activeTextFieldModel else { return }
            item.validate()
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            tableView.beginUpdates()
            if let inputFieldViewCell = cell as? InputFieldView {
                inputFieldViewCell.configure(with: model, delegate: self, tag: item.tag)
            }
            tableView.endUpdates()
        }

        deinit {
            print("---- \(self) deinit")
        }

    }

    extension FormViewController: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text, let textRange = Range(range, in: text) else { return true }
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            textField.text = updatedText

            guard let indexPath = viewModel?.indexPath(for: textField.tag), let configuration = activeTextFieldModel else { return false }
            configuration.state.value = updatedText

            guard let validatesOnKeypress = configuration.inputFieldConfiguration?.validatesOnKeypress, validatesOnKeypress else { return false }
            configuration.state.selectedTextRange = textField.selectedTextRange
            textFieldDidUpdate(updatedText, for: indexPath)
            return false
        }

        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            activeTextField = textField
            guard let indexPath = viewModel?.indexPath(for: textField.tag), let item = viewModel.item(at: indexPath) else { return true }

            activeTextFieldIndexPath = indexPath

            if let itemWithLabel = item as? InputField {
                activeTextFieldModel = itemWithLabel.model
            }
            guard let configuration = activeTextFieldModel, let isSelectionEntry = configuration.inputFieldConfiguration?.isSelectionEntry, isSelectionEntry else { return true }
            selectItem(textField.tag, configuration.state.value) { [weak self] value in
                configuration.state.value = value ?? ""
                textField.text = configuration.format(configuration.state.value)
                let updatedValue = value
                self?.textFieldDidUpdate(updatedValue, for: indexPath)
            }
            return false
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            activeTextField?.resignFirstResponder()
            activeTextField = nil
            activeTextFieldIndexPath = nil
            activeTextFieldModel = nil
            return true
        }
    }
