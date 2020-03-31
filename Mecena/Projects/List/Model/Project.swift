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
    
    var formatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.currencyGroupingSeparator = "."
        return formatter
    }()
    
    var donationOptions: [Donation] {
        return [
            Donation(value: 5000, title: "Donar sin recompensa", description: "Apoyar por que crees en este proyecto"),
            Donation(value: totalNeeded / 200, title: "Recompensa 1", description: "Apoyar el proyecto para recibir los benefiocios basicos"),
            Donation(value: totalNeeded / 100, title: "Recompensa 2", description: "Apoyar el proyecto para recibir los benefiocios intermedios"),
            Donation(value: totalNeeded / 80, title: "Recompensa 3", description: "Apoyar el proyecto para recibir los benefiocios exclusivos"),
            Donation(value: totalNeeded / 60, title: "Recompensa 4", description: "Apoyar el proyecto para recibir todos los beneficios ofrecidos por el emprendedor")
        ]
    }
    
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
         creationDate: Date) {
        
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
    }
    
    static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
