//
//  PostTableViewCell.swift
//  SocialBlob
//
//  Created by Guarumo on 8/9/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var date_st: UILabel!
    @IBOutlet weak var text_post: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profile_picture: UIImageView!
    @IBOutlet weak var post_picture: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
