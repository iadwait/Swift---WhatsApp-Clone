//
//  chatViewCell.swift
//  Protocol Delegate Practice
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class chatViewCell: UITableViewCell {

    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
