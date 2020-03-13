//
//  LoginViewController.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LoginButtonClicked(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self](user, error) in
            if error == nil{
                self?.navigateToTweetsVC()
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self?.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func navigateToTweetsVC() {
        let tweetsVC = storyboard?.instantiateViewController(withIdentifier: "TweetsTableViewController") as! TweetsTableViewController
        self.navigationController?.pushViewController(tweetsVC, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
