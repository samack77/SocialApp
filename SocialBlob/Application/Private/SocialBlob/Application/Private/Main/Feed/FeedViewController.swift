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
        
//        Alamofire.request(.GET, method: feed_url, parameters: nil)
//            .response { (request, response, data, error) in
//                println(data) // if you want to check XML data in debug window.
//                var xml = SWXMLHash.parse(data!)
//                for elem in xml["rss"]["channel"]["item"].all {
//                    print(elem["title"].element!.text!)
//                }
//        }
    }
}

extension FeedViewController: UITableViewDelegate{
    
}

extension FeedViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
            cell.post_picture.af_setImage(withURL: url_picture_image, placeholderImage: UIImage(named: "post_image")!)
        }
        return cell
    }
}
