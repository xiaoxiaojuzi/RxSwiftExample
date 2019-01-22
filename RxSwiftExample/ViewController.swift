//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by LvjuWang on 2019/1/22.
//  Copyright © 2019 ljwang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {
    var suggestionTextView = UITextView()
    var contactTextField = UITextField()
    var charLimitlabel = UILabel()
    var submitButton = UIButton()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        configUI()
        suggestionTextView.rx.text
            .bind(to: charLimitlabel.rx.text)
            .disposed(by: disposeBag)
        submitButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.showSubmitSuccessful()
            }).disposed(by: disposeBag)
    }
    func configUI() {
        view.backgroundColor = UIColor.RxSwiftExample.TableViewBackgroud
        let borderWidth = CGFloat(1)
        let borderColor = UIColor(hexString: "#E8E9EB").cgColor
        suggestionTextView.layer.borderWidth = borderWidth
        suggestionTextView.layer.borderColor = borderColor
        view.addSubview(suggestionTextView)
        suggestionTextView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
            make.height.equalTo(150)
        }
        charLimitlabel.textColor = .red
        charLimitlabel.textAlignment = .right
        charLimitlabel.numberOfLines = 0
        view.addSubview(charLimitlabel)
        charLimitlabel.snp.makeConstraints { (make) in
            make.top.equalTo(suggestionTextView.snp.bottom).offset(-20)
            make.trailing.equalTo(suggestionTextView.snp.trailing)
        }
        view.addSubview(contactTextField)
        contactTextField.layer.borderWidth = borderWidth
        contactTextField.layer.borderColor = borderColor
        contactTextField.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(suggestionTextView)
            make.top.equalTo(suggestionTextView.snp.bottom).offset(20)
            make.height.equalTo(44)
        }
        view.addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(contactTextField.snp.bottom).offset(8)
            make.height.equalTo(40)
        }
        submitButton.layer.cornerRadius = 20
        submitButton.tintColor = UIColor.white
        submitButton.backgroundColor = UIColor.RxSwiftExample.grayYellow
    }
    func showSubmitSuccessful() {
        let alert = UIAlertController.init(title: "", message: "提交成功", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消", style: .default, handler: nil)
        let ok = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
