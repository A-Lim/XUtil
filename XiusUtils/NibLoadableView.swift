//
//  NibLoadableView.swift
//  Ubiqtrac
//
//  Created by SAINS on 27/09/2016.
//  Copyright © 2016 SAINS. All rights reserved.
//

import UIKit

/**
 Any view that loads from a nib have to confirm to NibLoadable view protocol. It will automatically have a NibName property that will Stringify the class name.
 */

protocol NibLoadableView: class {
    
}

/**
 Stringify the class name into a nibName
 prevent string typo errors and allows more readability
 */

extension NibLoadableView where Self: UIView {
    static var NibName:String {
        return String(describing: self)
    }
}
