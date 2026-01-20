//
//  UIBuilder.swift
//  NovaSdkDemo
//
//  Created on 2024/9/9.
//

import UIKit
import Foundation

class UIBuilder: NSObject {

    static let build: UIBuilder = UIBuilder()

    func buildTextField(_ text: String, _ placeholder: String = "") -> UITextField {
        let textField = UITextField()
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.text = text
        return textField
    }

    func buildButton(_ title: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }

    func buildInputView(_ title: String, _ placeholder: String = "") -> (UIView, UITextField) {
        let inputView = UIView()
        inputView.backgroundColor = .clear

        let label = UILabel()
        label.text = title
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.textAlignment = .right
        inputView.addSubview(label)

        let textField = UITextField()
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        inputView.addSubview(textField)
        label.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(78)
        }

        textField.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(8)
            make.top.bottom.equalTo(label)
            make.right.equalToSuperview()
        }

        return (inputView, textField)
    }

}
