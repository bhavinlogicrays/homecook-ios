//
//  HomeVCCell.swift
//  

import UIKit

class HomeVCCell: UITableViewCell {

    // MARK: - Variables
    // MARK: - UIControlls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    @IBOutlet weak var lblDelTime: UILabel!
    @IBOutlet weak var lblHomeCook: UILabel!
    
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
