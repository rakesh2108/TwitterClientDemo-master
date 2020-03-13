//
//  TwitterLoginViewController.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        navigateToLoginScreen()
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        navigateToSignUpScreen()
    }
    
    private func navigateToLoginScreen() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    private func navigateToSignUpScreen() {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: false)
    }
    
}
