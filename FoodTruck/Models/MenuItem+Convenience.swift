//
//  MenuItem+Convenience.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import CoreData

extension MenuItem {
    var itemRepresentation: ItemRepresentation? {
        guard
            let itemName = itemName,
            let image = image,
            let imageURL = URL(string: image),
            let itemDescription = itemDescription,
            let itemRatings = itemRatings
            else { return nil }
        
        return ItemRepresentation(identifier: Int(identifier), itemName: itemName, image: imageURL, itemDescription: itemDescription, itemPrice: itemPrice, itemRatings: itemRatings, averageRating: averageRating)
    }
    
    @discardableResult convenience init?(identifier: Int64,
                                         itemName: String,
                                         image: String,
                                         itemDescription: String,
                                         itemPrice: Double,
                                         itemRatings: [Double]? = [5],
                                         averageRating: Double,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.identifier = identifier
        self.itemName = itemName
        self.image = image
        self.itemDescription = itemDescription
        self.itemPrice = itemPrice
        self.itemRatings = itemRatings
        self.averageRating = averageRating
    }
    
    @discardableResult convenience init?(itemRepresentation: ItemRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(identifier: Int64(itemRepresentation.identifier),
                  itemName: itemRepresentation.itemName,
                  image: itemRepresentation.image.absoluteString,
                  itemDescription: itemRepresentation.itemDescription,
                  itemPrice: itemRepresentation.itemPrice,
                  itemRatings: itemRepresentation.itemRatings,
                  averageRating: itemRepresentation.averageRating,
                  context: context)
    }
}
