//
//  FoodTruckAPIController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class FoodTruckApiController {

    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }

    enum NetworkError: Error {
        case badUrl
        case noAuth
        case badAuth
        case otherError
        case badData
        case noDecode
        case badImage
        case failedFetch
    }

    

}
