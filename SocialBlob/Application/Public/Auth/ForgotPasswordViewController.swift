//
//  ForgotPasswordViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/5/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: AuthViewController {
    
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        if self.isLoading{
            return
        }
        
        if self.passwordField!.text!.isEmpty {
            self.showAlertWith(text: "Password field is required", title: "Something went wrong")
            return
        }
        self.switchLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.switchLoading()
            self.showAlertWith(text: "An email was sent", title: "Check your inbox", handleAlert:{(alert: UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                })
        })
    }

}
