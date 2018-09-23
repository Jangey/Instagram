//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Jangey Lu on 9/23/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    //@IBOutlet weak var homeTableCell: UITableViewCell!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var likeCountButton: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var captionLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
