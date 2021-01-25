//
//  HomeVC2Cell.swift
//  

import UIKit

protocol HomeVC2CellDelegate: NSObjectProtocol {
    func didPressOnCell(_ Index: Int)
}

class HomeVC2Cell: UITableViewCell {

    // MARK: - Variables
    var row = 0
    
    // MARK: - UIControlls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    @IBOutlet weak var lblDelTime: UILabel!
    @IBOutlet weak var lblHomeCook: UILabel!
    weak var delegate: (NSObjectProtocol & HomeVC2CellDelegate)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickFoodCell(_ sender: UIButton) {
        delegate?.didPressOnCell(row)
    }

}

