//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Chetan Sanwariya on 09/02/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        print(emailTextField.text!)
        print(passwordTextField.text!)
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    
                    self.performSegue(withIdentifier: "RegisterSegue", sender: self)
                    
                    if let result = authResult {
                        print(result.user.email!)
                    }
                }
            }
        }
    }
    


}
