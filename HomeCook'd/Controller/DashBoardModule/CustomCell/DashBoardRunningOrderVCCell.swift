//
//  DashBoardRunningOrderVCCell.swift
//

import UIKit

class DashBoardRunningOrderVCCell: UITableViewCell {

    // MARK:- Variables
    
    // MARK:- UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblInvoice: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
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
        
        btnDone.layer.cornerRadius = btnDone.frame.size.height/2
        btnDone.layer.masksToBounds = true
        
        btnCancel.layer.cornerRadius = btnCancel.frame.size.height/2
        btnCancel.layer.masksToBounds = true
    }

}

