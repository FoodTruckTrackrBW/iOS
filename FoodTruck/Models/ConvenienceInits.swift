//
//  ConvenienceInits.swift
//  FoodTruck
//
//  Created by Bradley Diroff on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import CoreData

extension User {
    @discardableResult convenience init(id: Int, username: String, password: String, userType: String, email: String, favoriteCuisineType: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.id = id
        self.username = username
        self.password = password
        self.userType = userType
        self.email = email
        self.favoriteCuisineType = favoriteCuisineType
    }
}

extension Truck {
    @discardableResult convenience init(id: Int, ownerId: Int, cuisineType: String, departureTime: String, truckImgUrl: String, truckName: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init()
        self.id = id
        self.ownerId = ownerId
        self.cuisineType = cuisineType
        self.departureTime = departureTime
        self.truckImgUrl = truckImgUrl
        self.truckName = truckName
    }
}

extension Items {
    @discardableResult convenience init(id: Int, itemPrice: Int, truckId: Int, itemDescription: String, itemName: String, itemPhotoUrl: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init()
        self.id = id
        self.itemPrice = itemPrice
        self.truckId = truckId
        self.itemDescription = itemDescription
        self.itemName = itemName
        self.itemPhotoUrl = itemPhotoUrl
        self.itemPrice = itemPrice
    }
}
