//
//  XUtil.swift
//  XiusUtils
//
//  Created by Alexius Lim Li Liang on 11/05/2017.
//  Copyright © 2017 Xius. All rights reserved.
//

import UIKit

class XUtil {
    /**
     Convert string to UIColor
     
     - parameter hex: hexString (#FFFFFF)
     - returns: UIColor from given hexString
     */
    static func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /**
     Remove duplicates in an array
     
     ### Usage example ###
     ````
     let array = ["four", "one", "two", "one", "three", "five", "one"]
     let uniqueArray = removeDuplicate(array)
     ````
     */
    static func removeDuplicate <S: Sequence, T: Hashable> (_ source: S) -> [T] where S.Iterator.Element == T {
        var buffer = [T]()
        var added = Set<T>()
        
        for elem in source {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
