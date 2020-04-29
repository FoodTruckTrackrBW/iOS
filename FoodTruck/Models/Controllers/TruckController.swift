//
//  TruckController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import CoreData

class TruckController {
    
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
    
    func fetchTasksFromServer() {
        
    }
}
