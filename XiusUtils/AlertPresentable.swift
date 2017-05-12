//
//  AlertPresentable.swift
//  Ubiqtrac
//
//  Created by SAINS on 27/09/2016.
//  Copyright © 2016 SAINS. All rights reserved.
//

import UIKit

protocol AlertPresentable {
    func displayAlert(messageTitle title: String, message: String)
}

// extension will only take place when the conformer inherits from UIViewController
extension AlertPresentable where Self: UIViewController {
    func displayAlert(messageTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
