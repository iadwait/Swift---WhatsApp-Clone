//
//  RecentViewCell.swift
//  WhatsAppClone
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class RecentViewCell: UITableViewCell {

    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTimeDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
