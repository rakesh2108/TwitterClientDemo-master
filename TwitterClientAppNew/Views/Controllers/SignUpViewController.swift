//
//  SignUpViewController.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if passwordTextField.text != passwordConfirmTextField.text{
              let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
              let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
              
              alertController.addAction(defaultAction)
              self.present(alertController, animated: true, completion: nil)
          }
          else{
              Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ [weak self](user, error) in
                  if error == nil {
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
    }
    private func navigateToTweetsVC() {
        let tweetsVC = storyboard?.instantiateViewController(withIdentifier: "TweetsTableViewController") as! TweetsTableViewController
        self.navigationController?.pushViewController(tweetsVC, animated: true)
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
