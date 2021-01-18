//
//  DashBoardVCCell.swift
//

import UIKit

protocol DashBoardVCCellDelegate: NSObjectProtocol {
    func didPressOnCell(_ Index: Int)
}

class DashBoardVCCell: UICollectionViewCell {
    
    // MARK:- Variables
    var row = 0
    
    // MARK:- UIControls
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    weak var delegate: (NSObjectProtocol & DashBoardVCCellDelegate)?

    // MARK: - IBAction Methods
    @IBAction func onClickFoodCell(_ sender: UIButton) {
        delegate?.didPressOnCell(row)
    }
    
}
