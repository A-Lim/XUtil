//
//  ReusableView.swift
//  Ubiqtrac
//
//  Created by SAINS on 27/09/2016.
//  Copyright © 2016 SAINS. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    
}

/**
 Stringify the class name into a nibName
 prevent string typo errors and allows more readability
 */
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {
    
}
