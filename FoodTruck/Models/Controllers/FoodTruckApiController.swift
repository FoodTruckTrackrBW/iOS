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
        case failedSignUp
        case failedSignIn
        case noData
        case badData
        case noAuth
        case badAuth
        case otherError
        case noDecode
        case badImage
        case noEncode
    }
    
    var bearer: Bearer?
    var truckDetails: [TruckDetails] = []
    var menu: [Menu] = []
    
    private let baseURL = URL(string: "https://food-truck-trackr-bw.herokuapp.com/api")!
    
    private lazy var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    private lazy var jsonDecoder = JSONDecoder()
    
    func signUp(with user: User, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let signUpUrl = baseURL.appendingPathComponent("auth/register")
        var request =  URLRequest(url: signUpUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            print(String(data: jsonData, encoding: .utf8)!)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.failure(.failedSignUp))
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                print("Sign up failed with error: \(error)")
                completion(.failure(.failedSignUp))
                return
            }
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                print("Sign up was unsuccessful")
                completion(.failure(.failedSignUp))
                return
            }
            print("Sign up successful!")
            completion(.success(true))
        }.resume()
    }
    
    func signIn(with user: UserLogin, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let logInURL = baseURL.appendingPathComponent("auth/login")
        var request = URLRequest(url: logInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let jsonData = try jsonEncoder.encode(user)
            print(String(data: jsonData, encoding: .utf8)!)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.failure(.failedSignIn))
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Sign in failed with error: \(error)")
                completion(.failure(.failedSignIn))
                return
            }
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                print("Sign in was unsuccessful")
                completion(.failure(.failedSignIn))
                return
            }
            guard let data = data else {
                print("Data was not received")
                completion(.failure(.noData))
                return
            }
            do {
                self.bearer = try self.jsonDecoder.decode(Bearer.self, from: data)
                print(self.bearer?.token)
                completion(.success(true))
            } catch {
                print("Error decoding bearer: \(error)")
                completion(.failure(.failedSignIn))
                return
            }
        }.resume()
    }
    
    func fetchTruckDetails(completion: @escaping (Result<[TruckDetails], NetworkError>) -> Void) {
        guard let bearer = bearer else {
            completion(.failure(.noAuth))
            return
        }
        
        let truckUrl = baseURL.appendingPathComponent("diner")
        var request = URLRequest(url: truckUrl)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error receiving truck details data: \(error)")
                completion(.failure(.otherError))
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                completion(.failure(.badAuth))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            // TODO: Dateformatter
            self.jsonDecoder.dateDecodingStrategy = .deferredToDate
            do {
                self.truckDetails = try self.jsonDecoder.decode([TruckDetails].self, from: data)
                completion(.success(self.truckDetails))
            } catch {
                print("Error decoding truck details object: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }.resume()
    }
    
    func fetchMenu(completion: @escaping (Result<[Menu], NetworkError>) -> Void) {
        guard let bearer = bearer else {
            completion(.failure(.noAuth))
            return
        }
        
        //https://food-truck-trackr-bw.herokuapp.com/api/diner/:id/menu
        let menuUrl = baseURL.appendingPathComponent("diner")
                                .appendingPathComponent(":id")
                                .appendingPathComponent("menu")
        var request = URLRequest(url: menuUrl)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error receiving menu details data: \(error)")
                completion(.failure(.otherError))
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                completion(.failure(.badAuth))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            do {
                self.menu = try self.jsonDecoder.decode([Menu].self, from: data)
                completion(.success(self.menu))
            } catch {
                print("Error decoding menu object: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }.resume()
    }
}











