//
//  RxSwiftViewController.swift
//  RxSwiftExample
//
//  Created by LvjuWang on 2019/1/22.
//  Copyright © 2019 ljwang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RxSwiftViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let suggestionTextViewInput = suggestionTextView.rx.text.orEmpty
        suggestionTextViewInput.map { "\($0.count)/200"}
            .bind(to: charLimitlabel.rx.text)
            .disposed(by: disposeBag)
        suggestionTextViewInput.map { String($0.prefix(self.limitCountForSuggestion)) }
            .bind(to: suggestionTextView.rx.text)
            .disposed(by: disposeBag)
        let suggestionTextViewValid = suggestionTextViewInput.map { $0.count > 0}
        let contactTextFieldValid = contactTextField.rx.text.orEmpty.map { $0.count > 0}
        Observable.combineLatest(suggestionTextViewValid, contactTextFieldValid) { $0 && $1 }
            .subscribe(onNext: { [weak self] isEnable in
                self?.setSubmitButtonSatus(isEnable: isEnable)
            })
            .disposed(by: disposeBag)
        submitButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.showSubmitSuccessfully()
            }).disposed(by: disposeBag)
    }
}
