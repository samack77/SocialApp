//
//  HomeViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/6/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOut(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "status")
        Switcher.updateRootVC()
    }
    
}
