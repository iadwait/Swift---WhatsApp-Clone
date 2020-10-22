//
//  ViewedViewCell.swift
//  WhatsAppClone
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewedViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
