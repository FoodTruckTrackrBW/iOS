//
//  AuthController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/25/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthController {
    
    func createAnAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (auth, error) in
            if let error = error {
                NSLog("Error creating account: \(error)")
            } else {
                if let auth = auth {
                    print("Account Creation Successful")
                    print(auth.user.email as Any)
                }
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { auth, error in
            if let error = error {
                print("Error signing into account: \(error)")
                // TODO: Sign In Error Handling UIAlertController
            } else {
                if let auth = auth {
                    print("Sign in Successful!!!")
                    print("The current user: \(auth.user)")
                    // TODO: UI for user successful sign in
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            if let error = error as NSError? {
                print ("Error Signing Out: %@", error)
            } else {
                print("Log out successful!")
            }
        }
    }
}
