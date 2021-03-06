//
//  Project.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 30/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import Foundation

class Project: Hashable {
    var identifier: Int
    var projectImageUrl: URL
    var ownerImageUrl: URL
    var title: String
    var productName: String
    var description: String
    var totalNeeded: Double
    var totalFounded: Double
    var totalDonators: Int
    var creationDate: Date
    var donationOptions: [Donation]
    var ownDonation: Donation?
    
    var formatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.currencyGroupingSeparator = "."
        return formatter
    }()
    
    var defaultDonations: [Double] {
        return [
            donationOptions[1].value,
            donationOptions[2].value,
            donationOptions[3].value
        ]
    }
    
    var defaultDonationsFormatted: [String] {
        return defaultDonations.map {
            return formatter.string(from: NSNumber(floatLiteral: $0)) ?? ""
        }
    }
    
    var totalNeededFormatted: String {
        return formatter.string(from: NSNumber(floatLiteral: totalNeeded)) ?? ""
    }
    
    var totalFoundedFormatted: String {
        return formatter.string(from: NSNumber(floatLiteral: totalFounded)) ?? ""
    }
    
    var progress: Double {
        return totalFounded / totalNeeded
    }
    
    var daysRemaining: Int {
        return Date.daysBetween(start: creationDate, end: Date())
    }
    
    init(identifier: Int,
         projectImageUrl: URL,
         ownerImageUrl: URL,
         title: String,
         productName: String,
         description: String,
         totalNeeded: Double,
         totalFounded: Double,
         totalDonators: Int,
         creationDate: Date,
         donationOptions: [Donation]) {
        
        self.identifier = identifier
        self.projectImageUrl = projectImageUrl
        self.ownerImageUrl = ownerImageUrl
        self.title = title
        self.productName = productName
        self.description = description
        self.totalNeeded = totalNeeded
        self.totalFounded = totalFounded
        self.totalDonators = totalDonators
        self.creationDate = creationDate
        self.donationOptions = donationOptions
    }
    
    static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    func performDonation(_ donation: Donation) {
        ownDonation = donation
        totalFounded += donation.value
        totalDonators += 1
    }
}
