//
//  FoodTruckAPIController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class FoodTruckApiController {
    
//    enum HTTPMethod: String {
//        case get = "GET"
//        case put = "PUT"
//        case post = "POST"
//        case delete = "DELETE"
//    }
//
//    enum NetworkError: Error {
//        case badUrl
//        case noAuth
//        case badAuth
//        case otherError
//        case badData
//        case noDecode
//        case badImage
//        case failedFetch
//    }
//
////    var truck = [Truck]()
//    var bearer: Bearer?
//
//    private let baseUrl = URL(string: "")!
//    private lazy var jsonDecoder = JSONDecoder()
//
//    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
//        let signUpUrl = baseUrl.appendingPathComponent("users/signup")
//
//        var request = URLRequest(url: signUpUrl)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let jsonEncoder = JSONEncoder()
//        do {
//            let jsonData = try jsonEncoder.encode(user)
//            request.httpBody = jsonData
//        } catch {
//            NSLog("Error encoding user object: \(error)")
//            completion(error)
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { _, response, error in
//            if let error = error {
//                completion(error)
//                return
//            }
//
//            if let response = response as? HTTPURLResponse,
//                response.statusCode != 200 {
//                completion(NSError(domain: response.description, code: response.statusCode, userInfo: nil))
//                return
//            }
//
//            completion(nil)
//        }.resume()
//    }
//
//    func signIn(with user: User, completion: @escaping (Error?) -> ()) {
//        let signInUrl = baseUrl.appendingPathComponent("users/login")
//
//        var request = URLRequest(url: signInUrl)
//        request.httpMethod = HTTPMethod.post.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let jsonEncoder = JSONEncoder()
//        do {
//            let jsonData = try jsonEncoder.encode(user)
//            request.httpBody = jsonData
//        } catch {
//            NSLog("Error encoding user object: \(error)")
//            completion(error)
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(error)
//                return
//            }
//
//            if let response = response as? HTTPURLResponse,
//                response.statusCode != 200 {
//                completion(NSError(domain: response.description, code: response.statusCode, userInfo: nil))
//                return
//            }
//
//            guard let data = data else {
//                completion(NSError(domain: "Data not found", code: 99, userInfo: nil))
//                return
//            }
//
//            let decoder = JSONDecoder()
//            do {
//                self.bearer = try decoder.decode(Bearer.self, from: data)
//                completion(nil)
//            } catch {
//                NSLog("Error decoding bearer object: \(error)")
//                completion(error)
//            }
//        }.resume()
//    }
//    /*
//    func searchForTruck(searchTerm: String, completion: @escaping (Result<Truck, NetworkError>) () -> Void) {
//        let requestURL = baseURL.appendingPathComponent(searchTerm)
//        var request = URLRequest(url: requestURL)
//        request.httpMethod = HTTPMethod.get.rawValue
//        print(requestURL)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Failed to fetch truck data with error \(error)")
//                completion(.failure(.failedFetch))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse,
//            response.statusCode == 200
//                else {
//                    print("Fetched truck received bad response")
//                    completion(.failure(.failedFetch))
//                    return
//            }
//
//            guard let data = data else {
//                return completion(.failure(.badData))
//            }
//
//            do {
//                let truck = try self.jsonDecoder.decode(Truck.self, from: data)
//                completion(.success(truck))
//            } catch {
//                print("Error decoding truck names: \(error)")
//                completion(.failure(.badData))
//            }
//        }.resume()
//    }
// */
}
