//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Jangey Lu on 9/23/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeTableViewCell: UITableViewCell {
    
    
    //@IBOutlet weak var homeTableCell: UITableViewCell!
    @IBOutlet weak var homeImage: PFImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var likeCountButton: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var captionLabel: UILabel!

    
    var instagramPost: PFObject!{
        didSet{
            usernameLabel.text = (instagramPost["author"] as! PFUser).username! as String
            captionLabel.text = instagramPost["caption"] as? String
            homeImage.file = instagramPost["media"] as? PFFile
            homeImage.loadInBackground()
            if let pastDate = (instagramPost.createdAt){
                postTime.text = pastDate.timeAgoDisplay()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
