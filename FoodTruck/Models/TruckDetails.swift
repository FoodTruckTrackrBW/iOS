//
//  TruckDetails.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/29/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct Results: Codable {
    let trucks: [TruckDetails]
}

struct TruckDetails: Codable {
    
    
    let id: Int
    let truckName: String
    let truckImage: String
    let cuisineType: String
    var departureTime: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case truckName = "truck_name"
        case truckImage = "truck_img_url"
        case cuisineType = "cuisine_type"
        case departureTime = "departure_time"
    }
}
