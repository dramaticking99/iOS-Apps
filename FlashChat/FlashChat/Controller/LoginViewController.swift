//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Chetan Sanwariya on 09/02/24.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error {
                    print(e)
                } else {
                    self!.performSegue(withIdentifier: "loginSegue", sender: self)
                }
            }
        }
        
       
    }
    

}
