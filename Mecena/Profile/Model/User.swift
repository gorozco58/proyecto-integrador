//
//  User.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 13/05/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import Foundation

enum Gender {
    case female
    case male
    
    var description: String {
        switch self {
        case .female:
            return "Femenino"
        case .male:
            return "Masculino"
        }
    }
}

class User {
    let imageUrl: URL
    let name: String
    let lastName: String
    let mail: String
    let phone: String
    let gender: Gender
    
    init(imageUrl: URL, name: String, lastName: String, mail: String, phone: String, gender: Gender) {
        self.imageUrl = imageUrl
        self.name = name
        self.lastName = lastName
        self.mail = mail
        self.phone = phone
        self.gender = gender
    }
}
