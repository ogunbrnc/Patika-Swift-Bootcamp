//
//  ToolBarPickerView.swift
//  CompanyManagement
//
//  Created by Ogün Birinci on 19.11.2022.
//

import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: AnyObject {
    func didTapDone(_ picker: ToolbarPickerView)
    func didTapCancel(_ picker: ToolbarPickerView)
}


class ToolbarPickerView: UIPickerView {

    public private(set) var toolbar: UIToolbar?
    public weak var toolbarDelegate: ToolbarPickerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
        doneButton.tintColor = .label
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped))
        cancelButton.tintColor = .label

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.toolbar = toolBar
    }

    @objc func doneTapped() {
        self.toolbarDelegate?.didTapDone(self)
    }

    @objc func cancelTapped() {
        self.toolbarDelegate?.didTapCancel(self)
    }

}
