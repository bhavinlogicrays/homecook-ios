//
//  TotalOrderVCCell.swift
//  

import UIKit

class TotalOrderVCCell: UITableViewCell {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblNumOfOrdr: UILabel!
    @IBOutlet weak var lblProgrs: UILabel!
    
    // MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
