//
//  User.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/29/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let username: String
    let password: String
    let email: String
    var userType: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case email
        case userType = "user_type"
    }
}
