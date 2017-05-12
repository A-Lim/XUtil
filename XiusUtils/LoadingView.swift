//
//  LoadingView.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 08/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    let spinner = UIActivityIndicatorView()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.color = .red
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        
        
        let centerX = NSLayoutConstraint(item: spinner, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: spinner, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
    }

}
