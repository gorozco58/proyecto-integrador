//
//  Donation.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 30/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import Foundation

class Donation {
    var value: Double
    var title: String
    var description: String
    var valueFormatted: String {
        return formatter.string(from: NSNumber(floatLiteral: value)) ?? ""
    }
    
    var formatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.currencyGroupingSeparator = "."
        return formatter
    }()
    
    init(value: Double, title: String, description: String) {
        self.value = value
        self.title = title
        self.description = description
    }
}
