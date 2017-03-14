//
//  InstagramCell.swift
//  instagram
//
//  Created by Gates Zeng on 3/9/17.
//  Copyright © 2017 Gates Zeng. All rights reserved.
//

import UIKit
import Parse

class InstagramCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var captionLabel: UILabel!

    var postData: PFObject! {
        didSet {
            
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
