//
//  ItemRepresentation.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct ItemRepresentation: Codable {
    let identifier: Int
    let itemName: String
    let image: URL
    let itemDescription: String
    let itemPrice: Double
    let itemRatings: [Double]
    let averageRating: Double
}
