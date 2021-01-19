//
//  CartVCCell.swift
//  

import UIKit

class CartVCCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cartImg: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
