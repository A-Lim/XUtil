//
//  XDateFormatter.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 11/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import Foundation

// define date formats here

enum XDateFormatter {
    /**
     Return dateFormatter (yyyy-MM-dd)
     Initializing formatters are extremely expensive (better to create once and reused)
     */
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    /**
     Return dateFormatter (HH:mm:ss)
     Initializing formatters are extremely expensive (better to create once and reused)
     */
    static let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    /**
     Return dateFormatter (yyyy-MM-dd HH:mm)
     Initializing formatters are extremely expensive (better to create once and reused)
     */
    static let dateTimeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}
