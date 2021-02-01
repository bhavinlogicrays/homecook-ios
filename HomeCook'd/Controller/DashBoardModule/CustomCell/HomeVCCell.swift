//
//  HomeVCCell.swift
//  

import UIKit

protocol HomeVCCellDelegate: NSObjectProtocol {
    func didPressOnCell(_ Index: Int)
    func didPressOnReview(_ Index: Int)
}

class HomeVCCell: UITableViewCell {

    // MARK: - Variables
    var row = 0
    
    // MARK: - UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    @IBOutlet weak var lblDelTime: UILabel!
    @IBOutlet weak var lblHomeCook: UILabel!
    weak var delegate: (NSObjectProtocol & HomeVCCellDelegate)?
    
    // MARK: - Cell Methods
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
    
    @IBAction func onClickReview(_ sender: UIButton) {
        delegate?.didPressOnReview(row)
    }

}
