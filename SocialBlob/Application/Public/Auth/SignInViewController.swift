//
//  SignInViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/6/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var loadingBackground: UIView?
    var loading: UIActivityIndicatorView?
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeLoading()
    }
    
    func makeLoading(){
        self.loadingBackground = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: self.view.frame.size))
        self.loading = UIActivityIndicatorView(style: .whiteLarge)
        self.loading?.center = self.view.center
        self.loadingBackground!.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        self.loading?.isHidden = true
        self.loadingBackground?.isHidden = true
        
        self.loading!.hidesWhenStopped = true
        self.loading!.startAnimating()
        
        self.view.addSubview(self.loadingBackground!)
        self.view.addSubview(self.loading!)
    }
    
    func switchLoading(){
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingBackground!.isHidden = !self.isLoading
            self.loading!.isHidden = !self.isLoading
        })
    }
    
    func navigateToPriveHome(){
        UserDefaults.standard.set(true, forKey: "status")
        Switcher.updateRootVC()
    }
    
    func showAlertSomethingWentWrongWith(text msg : String){
        let alertController = UIAlertController(title: "Something went wrong", message: msg, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Function to signIn into the app
    @IBAction func signIn(_ sender: Any) {
        if self.isLoading{
            return
        }
        
        if self.emailField!.text!.isEmpty || self.passwordField!.text!.isEmpty {
            self.showAlertSomethingWentWrongWith(text: "All fields are required")
            return
        }
        
        self.isLoading = true
        self.switchLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.isLoading = false
            if self.emailField!.text == "demo@demo.com" && self.passwordField.text == "123456" {
                self.navigateToPriveHome()
            }else{
                self.showAlertSomethingWentWrongWith(text: "Invalid credentials. Email will be: demo@demo.com and password: 123456")
                self.switchLoading()
            }
        })
    }
}
