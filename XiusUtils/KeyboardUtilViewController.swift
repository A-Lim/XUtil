//
//  KeyboardUtilViewController.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 09/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import UIKit
import Cartography

class KeyboardUtilViewController: UIViewController {
    
    // UIElements
    var textField:UITextField!
    var label:UILabel!
    
    let xKeyboardUtil = XKeyboardUtil()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        assignConstraints()
    }
    
    func configureView() {
        // configure keyboard 
        xKeyboardUtil.registerKeyboardNotifications()
        
        // hides keyboard when tapped 
        hideKeyboardWhenTappedAround()
        
        view.backgroundColor = .white
        
        textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.placeholder = "Enter text here"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "Toggle Keyboard to see scroll effect"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
    }
    
    func assignConstraints() {
        constrain(textField, label) { textField, label in
            guard let superview = textField.superview else { return }
            label.centerX == superview.centerX
            
            textField.height == 40
            textField.topMargin == label.baseline + 20
            textField.bottomMargin == superview.bottomMargin - 40
            textField.leftMargin == superview.leftMargin + 10
            textField.rightMargin == superview.rightMargin - 10
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        xKeyboardUtil.removeKeyboardNotifications()
    }
}

extension KeyboardUtilViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        xKeyboardUtil.textFieldIsClicked(textField: textField, currentView: view)
    }
}
