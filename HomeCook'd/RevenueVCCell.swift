//
//  RevenueVCCell.swift
//  
import UIKit

class RevenueVCCell: UITableViewCell {

    // MARK:- Variables
    // MARK:- UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    
    // MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        imgFood.layer.cornerRadius = 20.0
        imgFood.layer.masksToBounds = true
        
        lblFoodType.layer.cornerRadius = lblFoodType.frame.size.height/2
        lblFoodType.layer.masksToBounds = true
    }

}
