//
//  FeedViewController.swift
//  SocialBlob
//
//  Created by Guarumo on 8/9/19.
//  Copyright © 2019 samack. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash
import AlamofireImage

class FeedViewController: UIViewController {
    
    var data: [Post] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.getFeed()
    }
    
    func getFeed(){
        let feed_url = "https://www.futbolred.com/rss-news/liga-de-espana.xml"
        Alamofire.request(feed_url).response {response in
            let xml = SWXMLHash.parse(response.data!)
            for elem in xml["rss"]["channel"]["item"].all {
                self.data.append(Post(fullname: elem["title"].element!.text, date_str: elem["pubDate"].element!.text, profile_picture_name: "profile_example", text: elem["description"].element!.text, picture_name: elem["enclosure"].element?.attribute(by: "url")?.text ?? "", liked: false))
            }
            self.tableView.reloadData()
        }
    }
}

extension FeedViewController: UITableViewDelegate{
    
}

extension FeedViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @objc func handleLikeAction(tag sender: UIButton){
        var post = self.data[sender.tag]
        post.liked = !post.liked
        self.data[sender.tag] = post
        
        UIView.performWithoutAnimation {
            let loc = self.tableView.contentOffset
            self.tableView.reloadRows(at: [IndexPath.init(row: sender.tag, section: 0)], with: .none)
            self.tableView.contentOffset = loc
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        let post = self.data[indexPath.row]
        cell.username.text = post.fullname
        cell.text_post.text = post.text
        cell.date_st.text = post.date_str
        if !post.profile_picture_name.isEmpty{
            cell.profile_picture.image = UIImage(named: post.profile_picture_name)
        }
        
        if !post.picture_name.isEmpty{
            let url_picture_image = URL(string: post.picture_name)!
            cell.post_picture.af_setImage(withURL: url_picture_image,
                placeholderImage: UIImage(named: "post_image")!, filter: nil,
                imageTransition: UIImageView.ImageTransition.noTransition,
                runImageTransitionIfCached: false) { response in
                    if response.response != nil {
                        // Force the cell update
                        self.tableView.beginUpdates()
                        self.tableView.endUpdates()
                    }
                }
        }
        
        if post.liked{
            cell.likeBtn.setImage(UIImage(named: "like_icon"), for: .normal)
        }else{
            cell.likeBtn.setImage(UIImage(named: "not_like_icon"), for: .normal)
        }
        
        cell.likeBtn.tag = indexPath.row
        cell.likeBtn.addTarget(self, action: #selector(FeedViewController.handleLikeAction(tag:)), for: .touchUpInside)
        
        return cell
    }
}
