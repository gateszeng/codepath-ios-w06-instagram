//
//  InstagramCell.swift
//  instagram
//
//  Created by Gates Zeng on 3/9/17.
//  Copyright © 2017 Gates Zeng. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstagramCell: UITableViewCell {
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var mainView: PFImageView!

    var postData: PFObject! {
        didSet {
            self.captionLabel.text = self.postData["caption"] as! String?
            
            self.mainView.file = self.postData["media"] as? PFFile
            self.mainView.loadInBackground()

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
