//
//  UIViewController+Exh.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 09/12/2016.
//  Copyright © 2016 SAINS. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

