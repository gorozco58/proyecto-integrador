//
//  App+UIColor.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 12/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainGreen: UIColor {
        return UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
    }
    
    static var mainGray: UIColor {
        return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    }
    
    static var borderGray: UIColor {
        return UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
    }
}

extension Date {
    public static func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
}
