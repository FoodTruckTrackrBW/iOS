//
//  TruckRepresentation.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct TruckRepresentation: Codable {
    let identifier: Int64
    let truckName: String
    let image: URL
    let cuisineType: String
    let customerRatings: [Double]
    let averageRating: Double
    let menu: [ItemRepresentation]?
}
