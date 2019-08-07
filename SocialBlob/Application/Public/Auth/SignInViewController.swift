//
//  SignInViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/6/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class SignInViewController: AuthViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigateToPrivateHome(){
        UserDefaults.standard.set(true, forKey: "status")
        Switcher.updateRootVC()
    }
    
    // Function to signIn into the app
    @IBAction func signIn(_ sender: Any) {
        if self.isLoading{
            return
        }
        
        if self.emailField!.text!.isEmpty || self.passwordField!.text!.isEmpty {
            self.showAlertWith(text: "All fields are required", title: "Something went wrong")
            return
        }
        self.switchLoading()        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.switchLoading()
            if self.emailField!.text == "demo@demo.com" && self.passwordField.text == "123456" {
                self.navigateToPrivateHome()
            }else{
                self.showAlertWith(text: "Invalid credentials. Email will be: demo@demo.com and password: 123456", title: "Something went wrong")
            }
        })
    }
}
