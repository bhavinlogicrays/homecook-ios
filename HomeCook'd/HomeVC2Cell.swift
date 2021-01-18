//
//  HomeVC2Cell.swift
//  

import UIKit

class HomeVC2Cell: UITableViewCell {

    // MARK: - Variables
    // MARK: - UIControlls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    @IBOutlet weak var lblDelTime: UILabel!
    @IBOutlet weak var lblHomeCook: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
