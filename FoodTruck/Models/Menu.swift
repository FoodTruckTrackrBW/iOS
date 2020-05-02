//
//  Menu.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/29/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct MenuResults: Codable {
    let menu: [Menu]
}

struct Menu: Codable {
    let id: Int
    let truckId: Int
    let itemName: String
    let itemDescription: String
    let itemPhoto: String
    let itemPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case truckId = "truck_id"
        case itemName = "item_name"
        case itemDescription = "item_description"
        case itemPhoto = "item_photo_url"
        case itemPrice = "item_price"
    }
}
