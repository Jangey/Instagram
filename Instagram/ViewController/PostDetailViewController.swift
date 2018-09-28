//
//  PostDetailViewController.swift
//  Instagram
//
//  Created by Jangey Lu on 9/27/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit
import ParseUI

class PostDetailViewController: UIViewController {
    
    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    var post : PFObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = post {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MMM-dd"
            let myString = formatter.string(from: post.createdAt!)
            postTime.text = myString
            
            captionLabel.text = post["caption"] as! String?
            postImageView.file = post["media"] as? PFFile
            postImageView.loadInBackground()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
