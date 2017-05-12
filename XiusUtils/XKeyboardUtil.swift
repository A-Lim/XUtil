//
//  LoginViewModel.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 09/05/2017.
//  Copyright © 2017 SAINS. All rights reserved.
//

import Foundation
import UIKit

/**
 Notes: To use this class
 1. All textFields must implements UITextFieldDelegate
 2. In viewDidLoad, registerKeyboardNotifications(_:)
 3. In viewDidDissapear, removeKeyboardNotifications(_:)
 4. In textFieldShouldBeginEditing, textFieldIsClicked(textField:, currentView:)
 
 TODO: Improve keyboard down functionality, got some delay
 */

class XKeyboardUtil {
    private var offSet:CGFloat = 0
    private let center = NotificationCenter.default
    private var focusedTextField:UITextField?
    private var currentView:UIView?
    private var textFieldIsActive = false
    
    func registerKeyboardNotifications() {
        center.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeKeyboardNotifications() {
        center.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    func textFieldIsClicked(textField: UITextField, currentView: UIView) {
        self.focusedTextField = textField
        self.currentView = currentView
        textFieldIsActive = true
    }
    
    @objc private func showKeyboard(_ notification: Notification) {
        if let _ = currentView as? UIScrollView {
            moveScrollViewUp(notification: notification)
        } else {
            moveViewUp(notification: notification)
        }
    }
    
    @objc private func hideKeyboard(_ notification: Notification) {
        if let _ = currentView as? UIScrollView {
            moveScrollViewDown()
        } else {
            moveViewDown()
        }
    }
    
    private func moveViewUp(notification: Notification) {
        let info = notification.userInfo!
        let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        guard let textField = focusedTextField,
            let view = currentView else { return }
        // NOTE: y position is counting from top to bottom
        // the y position of the bottom of the textfield
        let lowerYPos = textField.frame.origin.y + textField.frame.size.height
        // the y position which is not covered by the keyboard
        let nonCoverPos = view.frame.size.height - keyboardFrame.height
        
        // if keyboard is covering the textfield
        if lowerYPos > nonCoverPos {
            if textFieldIsActive {
                offSet = CGFloat(lowerYPos) - nonCoverPos + CGFloat(10)
                view.frame = view.frame.offsetBy(dx: 0, dy: -offSet)
                textFieldIsActive = false
            }
        }
    }
    
    private func moveViewDown() {
        guard let view = currentView else { return }
        if !textFieldIsActive {
            view.frame = view.frame.offsetBy(dx: 0, dy: offSet)
            textFieldIsActive = false
        }
    }
    
    private func moveScrollViewUp(notification: Notification) {
        let info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height + 10, 0.0)
        
        guard let view = currentView as? UIScrollView else { return }
        
        view.contentInset = contentInsets
        view.scrollIndicatorInsets = contentInsets
    }
    
    private func moveScrollViewDown() {
        let contentInsets : UIEdgeInsets = UIEdgeInsets.zero
        
        guard let view = currentView as? UIScrollView else { return }
        
        view.contentInset = contentInsets
        view.scrollIndicatorInsets = contentInsets
    }
}
