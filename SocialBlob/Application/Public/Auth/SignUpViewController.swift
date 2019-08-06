//
//  SignUpViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/5/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit
import Lottie

class SignUpViewController: AuthViewController {
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var Animation: LOTAnimationView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Animation.setAnimation(named: "2885-avatar-animations")
        Animation.loopAnimation = true
        Animation.play()
        
        imagePicker.delegate = self
    }
    
    
    @IBAction func getPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "Get Photo", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default , handler:{ (UIAlertAction)in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Picture.contentMode = .scaleAspectFit
            Picture.image = pickedImage
            Animation.isHidden = true
        }        
        dismiss(animated: true, completion: nil)
    }
}

