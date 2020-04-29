//
//  MenuItemController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import CoreData

class MenuItemController {
    
    enum NetworkError: Error {
        case noIdentifier
        case otherError
        case noData
        case noDecode
        case noEncode
        case noRep
    }
    
    let baseURL = URL(string: "https://food-truck-trackr-bw.herokuapp.com/api")!
    
    typealias CompletionHandler = (Result<Bool, NetworkError>) -> Void
    
    init() {
        fetchTasksFromServer()
    }
    
    func fetchTasksFromServer(completion: @escaping CompletionHandler = { _ in }) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            if let error = error {
                NSLog("Error fetching tasks: \(error)")
                completion(.failure(.otherError))
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from fetch")
                completion(.failure(.noData))
                return
            }
            
            do {
                let itemRepresentations = Array(try JSONDecoder().decode([String : ItemRepresentation].self, from: data).values)
                try self.updateItems(with: itemRepresentations)
                completion(.success(true))
            } catch {
                NSLog("Error decoding items from server: \(error)")
                completion(.failure(.noDecode))
            }
        }.resume()
    }
    
    
    private func updateItems(with representations: [ItemRepresentation]) {
    }

    private func update(item: MenuItem, with representation: ItemRepresentation) {
        item.itemName = representation.itemName
        item.image = representation.image.absoluteString
        item.itemDescription = representation.itemDescription
        item.itemPrice = representation.itemPrice
        item.itemRatings = representation.itemRatings
        item.averageRating = representation.averageRating
    }
}



