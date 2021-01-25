//
//  CustomFaqtblCell.swift
//  HomeCook'd
//
//  Created by admin on 22/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import UIKit

class CustomFaqtblCell: UITableViewCell {

    
    @IBOutlet weak var lblHeader:UILabel!
    @IBOutlet weak var imgDopDown:UIImageView!
    @IBOutlet weak var lblDetail:UILabel!
    @IBOutlet weak var viewBorder:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
