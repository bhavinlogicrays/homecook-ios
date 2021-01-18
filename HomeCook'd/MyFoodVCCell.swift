//
//  MyFoodVCCell.swift

import UIKit

protocol MyFoodVCCellDelegate: NSObjectProtocol {
    func didPressOnCell(_ Index: Int)
}
class MyFoodVCCell: UITableViewCell {

    // MARK:- Variables
    // MARK:- Variables
    var row = 0
    
    // MARK:- UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblReviews: UILabel!
    weak var delegate: (NSObjectProtocol & MyFoodVCCellDelegate)?
    
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
    }

    @IBAction func onClickCell(_ sender: Any) {
        delegate?.didPressOnCell(row)
    }
}
