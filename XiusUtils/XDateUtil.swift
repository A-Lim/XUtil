//
//  XDateUtil.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 11/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import Foundation

struct XDateUtil {
    /**
     Calculate the number of days between two dates
     */

    static func daysBetween(_ startDate:Date, endDate:Date) -> Int {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day], from: startDate, to: endDate, options: [])
        
        guard let _ = components.day else {
            print("Error: components.day is nil")
            return 0
        }
        return components.day!
    }
    
    /**
     Checks if start date is earlier than end date
    */
    static func check(_ startDate:Date, isEarlierThan endDate:Date) -> Bool {
        return startDate.compare(endDate) == .orderedAscending
    }
}
