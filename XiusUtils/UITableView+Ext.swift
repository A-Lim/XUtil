//
//  UITableView+Exh.swift
//  Ubiqtrac
//
//  Created by SAINS on 27/09/2016.
//  Copyright © 2016 SAINS. All rights reserved.
//

import UIKit

extension UITableView {
    /**
     - Parameter T: takes in a UITableViewCell that conforms to ReusableView and NibLoadableView protocol.
     
     So instead of doing this:
     ```
     let meterInfoNib = UINib(nibName: MeterInfoCell.NibName, bundle: nil)
     tableView.registerNib(meterInfoNib, forCellReuseIdentifier: MeterInfoCell.reuseIdentifier)
     ```
     Only this is required:
     ```
     tableView.register(MeterInfoCell)
     ```
     */
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T:NibLoadableView {
        let nib = UINib(nibName: T.NibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /**
     - Parameter T: takes in a type that conforms to ReusableView
     Usage example:
     ```
     let cell = tableView.dequeueReusableCell(forIndexPath:indexPath) as MeterInfoCell
     ```
     */
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T:ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
