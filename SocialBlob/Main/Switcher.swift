//
//  Switcher.swift
//  SocialBlob
//
//  Created by Guarumo on 8/6/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit
import Foundation

class Switcher {
    static func updateRootVC(){
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        if(status == true){
            rootVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "homeTabs") as! HomeTabBarController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signIn") as! SignInViewController
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC        
    }

}
