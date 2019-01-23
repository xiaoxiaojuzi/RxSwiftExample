//
//  NormalViewController.swift
//  RxSwiftExample
//
//  Created by LvjuWang on 2019/1/23.
//  Copyright © 2019 ljwang. All rights reserved.
//

import Foundation
import UIKit
class NormalViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionTextView.delegate = self
        contactTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        submitButton.addTarget(self, action: #selector(showSubmitSuccessfully), for: .touchUpInside)
    }
    func checkButtonStatus() {
        setSubmitButtonSatus(isEnable: suggestionTextView.text.count > 0 && (contactTextField.text?.count ?? 0) > 0)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        checkButtonStatus()
    }
}

extension NormalViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= limitCountForSuggestion
    }
    func textViewDidChange(_ textView: UITextView) {
        checkButtonStatus()
        charLimitlabel.text =  "\(textView.text.count) / \(limitCountForSuggestion)"
    }
}
