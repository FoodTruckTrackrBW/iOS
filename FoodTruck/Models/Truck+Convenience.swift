//
//  Truck+Convenience.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import CoreData

extension Truck {
    
    var truckRepresentation: TruckRepresentation? {
        guard
            let name = truckName,
            let image = image,
            let imageURL = URL(string: image),
            let cuisineType = cuisineType,
            let customerRatings = customerRatings
            else { return nil }
        
        var menuItems = [ItemRepresentation]()
        
       
        if let menu = menuItem {
            for item in menu {
                if let menuItem = item as? MenuItem, let menuItemRep = menuItem.itemRepresentation {
                    menuItems.append(menuItemRep)
                }
            }
        }
        
        
        return TruckRepresentation(identifier: Int64(identifier), truckName: name, image: imageURL, cuisineType: cuisineType,  customerRatings: customerRatings, averageRating: averageRating, menu: menuItems)
    }
    
    @discardableResult convenience init?(identifier: Int64,
                                         truckName: String,
                                         image: String,
                                         cuisineType: String,
                                         customerRatings: [Double]? = [5],
                                         averageRating: Double,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.identifier = identifier
        self.image = image
        self.cuisineType = cuisineType
        self.customerRatings = customerRatings
        self.averageRating = averageRating
    }
    
    @discardableResult convenience init?(truckRepresentation: TruckRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(identifier: truckRepresentation.identifier,
                  truckName: truckRepresentation.truckName,
                  image: truckRepresentation.image.absoluteString,
                  cuisineType: truckRepresentation.cuisineType,
                  customerRatings: truckRepresentation.customerRatings,
                  averageRating: truckRepresentation.averageRating,
                  context: context)
    }
}
