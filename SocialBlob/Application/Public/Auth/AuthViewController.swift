//
//  AuthViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/5/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    var loadingBackground: UIView?
    var loading: UIActivityIndicatorView?
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.makeLoading()
    }

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
        self.isLoading = !self.isLoading
        UIView.animate(withDuration: 0.5, animations: {
            self.loadingBackground!.isHidden = !self.isLoading
            self.loading!.isHidden = !self.isLoading
        })
    }
    
    func showAlertWith(text msg : String, title: String = "Alert", handleAlert : ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "OK", style: .default, handler: handleAlert)
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }

}
