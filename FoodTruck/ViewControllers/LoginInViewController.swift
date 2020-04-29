//
//  LoginInViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/24/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginInViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?
    let apiController = FoodTruckApiController()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener({ auth, user in
            if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "LoginToMainScreenShowSegue", sender: self)
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        login()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func login() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        gigController.signUp(with: user, completion: { error in
            if let error = error {
                NSLog("Error occurred during sign up: \(error)")
            } else {
                
                gigController?.signIn(with: user, completion: { error in
                    if let error = error {
                        NSLog("Error occurred during sign in: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                })
                
            }
        /*
        authController.signIn(email: email, password: password)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "LoginToMainScreenShowSegue", sender: self)
        }
 */
    }
}
