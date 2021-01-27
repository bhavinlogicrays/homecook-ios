//
//  AddressVCCell.swift
//  

import UIKit

protocol AddressVCCellDelegate: NSObjectProtocol {
    func didPressOnCell(_ Index: Int)
    func didPressOnEdit (_ Index: Int)
}

class AddressVCCell: UITableViewCell {

    // MARK: - Variables
    var row = 0
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAdrs: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    
    weak var delegate: (NSObjectProtocol & AddressVCCellDelegate)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onClickCell(_ sender: UIButton) {
        delegate?.didPressOnCell(row)
    }
    
    @IBAction func onClickEdit(_ sender: UIButton) {
        delegate?.didPressOnEdit(row)
    }
}
