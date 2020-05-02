//
//  StartViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

enum UserType: String {
    case driver = "operator"
    case diner = "diner"
}
class StartViewController: UIViewController {
    
    let foodtruckApiController = FoodTruckApiController()
    var userType: UserType = .driver
    
    @IBOutlet weak var driverDinerSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func driverDinerSegmentControlTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.userType = .diner
            print(userType.rawValue)
        } else {
            self.userType = .driver
            print(userType.rawValue)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignupShowSegue" {
            guard let signUpVC = segue.destination as? SignUpViewController else { return }
            signUpVC.userType = userType
            signUpVC.foodTruckApiController = foodtruckApiController
        } else if segue.identifier == "LoginShowSegue" {
            guard let logInVC = segue.destination as? LoginInViewController else { return }
            logInVC.userType = userType
            logInVC.foodTruckApiController = foodtruckApiController
        }
        
        
    }
}
