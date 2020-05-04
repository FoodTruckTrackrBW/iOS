//
//  SignUpViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit


typealias completion = Result<User?, Error>

class SignUpViewController: UIViewController {
    var foodTruckApiController: FoodTruckApiController?
    var userType: UserType?
//    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let newUser = User(username: "Steph1287431", password: "password982", email: "steph5123@gmail.com", userType: "diner")
//        foodTruckApiController.signUp(with: newUser) { (_) in
//        }
//        let loginUser = UserLogin(username: "Steph1287431", password: "password982")
//        foodTruckApiController.signIn(with: loginUser) { (_) in
//            self.foodTruckApiController.fetchTruckDetails { (_) in
//                print(self.foodTruckApiController.truckDetails.count)
//                let truck = self.foodTruckApiController.truckDetails[1]
//                self.foodTruckApiController.fetchMenu(truck: truck) { (_) in
//
//                }
//            }
//        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        handle = Auth.auth().addStateDidChangeListener({ auth, user in
//            
//        })
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //        Auth.auth().removeStateDidChangeListener(handle!)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        guard
            let email = emailTextField.text,
            let userType = userType,
            let password = passwordTextField.text,
            !password.isEmpty,
            !email.isEmpty
            else { return }
        let user = User(email: email, password: password, userType: userType.rawValue)
        foodTruckApiController?.signUp(with: user) { (_) in
            print("Sign Up Successful!")
        }
    }
    
//    private func signUp() {
//        guard let email = emailTextField.text,
//            let password = passwordTextField.text else { return }
//
//        Auth.auth().createUser(withEmail: email, password: password) { auth, error in
//            if let error = error {
//                print("Error creating account: \(error)")
//                self.presentUserInfoAlert(title: "Error!", message: "There was a problem creating your account, please try again.")
//            } else {
//                if let auth = auth {
//                    print("Success!!!")
//                    print(auth.user.uid)
//                    print(auth.user.email as Any)
//                }
//            }
//        }
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
