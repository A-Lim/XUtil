//
//  DateFormatterViewController.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 12/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import UIKit
import Cartography

class DateFormatterViewController: UIViewController {
    
    var textLabel1:UILabel!
    var textLabel2:UILabel!
    var textLabel3:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        assignConstrain()
    }
    
    func configureView() {
        view.backgroundColor = .white
        textLabel1 = UILabel(frame: .zero)
        textLabel2 = UILabel(frame: .zero)
        textLabel3 = UILabel(frame: .zero)
        
        textLabel1.translatesAutoresizingMaskIntoConstraints = false
        textLabel2.translatesAutoresizingMaskIntoConstraints = false
        textLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel1.textAlignment = .center
        textLabel2.textAlignment = .center
        textLabel3.textAlignment = .center
        
        view.addSubview(textLabel1)
        view.addSubview(textLabel2)
        view.addSubview(textLabel3)
        
        textLabel1.text = XDateFormatter.dateFormat.string(from: Date())
        textLabel2.text = XDateFormatter.timeFormat.string(from: Date())
        textLabel3.text = XDateFormatter.dateTimeFormat.string(from: Date())
        
    }
    
    func assignConstrain() {
        constrain(textLabel1, textLabel2, textLabel3) { label1, label2, label3 in
            guard let superview1 = label1.superview else { return }
            
            label1.centerX == superview1.centerX
            label1.centerY == superview1.centerY
            
            label2.topMargin == label1.bottomMargin + 20
            label2.leading == label1.leading
            label2.trailing == label2.trailing
            
            label3.topMargin == label2.bottomMargin + 20
            label3.leading == label2.leading
            label3.trailing == label3.trailing
        }
    }
}
