//
//  DashBoardOrderRequestVCCell.swift
//  

import UIKit

class DashBoardOrderRequestVCCell: UITableViewCell {

    // MARK:- UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblInvoice: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    
    // MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        imgFood.layer.cornerRadius = 15.0
        imgFood.layer.masksToBounds = true
        
        lblFoodType.layer.cornerRadius = lblFoodType.frame.size.height/2
        lblFoodType.layer.masksToBounds = true
        
        btnAccept.layer.cornerRadius = btnAccept.frame.size.height/2
        btnAccept.layer.masksToBounds = true
    }

}
