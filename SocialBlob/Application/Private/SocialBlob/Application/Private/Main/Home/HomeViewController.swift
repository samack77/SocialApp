//
//  HomeViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/6/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    var plusButton : UIButton?
    var profileButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.makeAditionalButtons()
    }
    
    func makeAditionalButtons(){
        self.plusButton = UIButton(frame: CGRect(x: (self.view.frame.width / 2) - 22 , y: (self.view.frame.height - (self.tabBar.frame.height / 2)) - 35, width: 44, height: 44))
        self.plusButton!.setImage(UIImage(named: "plus"), for: .normal)
        self.plusButton!.tag = 2
        self.plusButton!.addTarget(self, action: #selector(HomeTabBarController.changeTabBy(tag:)), for: .touchUpInside)
        self.view.addSubview(self.plusButton!)
        
        self.profileButton = UIButton(frame: CGRect(x: self.tabBar.frame.width  - (self.tabBar.frame.width / 5), y: (self.view.frame.height - self.tabBar.frame.height) - 18, width: self.tabBar.frame.width / 5, height: self.tabBar.frame.width / 5))
        self.profileButton!.setImage(UIImage(named: "profile_example"), for: .normal)
        self.profileButton!.tag = 4
        self.profileButton!.addTarget(self, action: #selector(HomeTabBarController.changeTabBy(tag:)), for: .touchUpInside)
        self.view.addSubview(self.profileButton!)
    }
    
    @objc func changeTabBy(tag sender: UIButton){
        self.selectedIndex = sender.tag
    }
    
}
