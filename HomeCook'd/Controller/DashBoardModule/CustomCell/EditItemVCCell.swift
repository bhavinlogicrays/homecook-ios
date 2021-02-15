//
//  EditItemVCCell.swift
//  

import UIKit

class EditItemVCCell: UICollectionViewCell {
    
    // MARK:- variables
    
    // MARK:- UIControls
    @IBOutlet weak var imgIngrs: UIImageView!
    @IBOutlet weak var imgVideoIcon: UIImageView!
    @IBOutlet weak var lblIngrName: UILabel!
    @IBOutlet weak var lblIngrName2: UILabel!
    @IBOutlet weak var btnPicker: UIButton!


    override func awakeFromNib() {
        imgIngrs.layer.cornerRadius  = imgIngrs.frame.size.width / 2
        imgIngrs.layer.borderWidth  = 1
        imgIngrs.layer.borderColor = UIColor.clear.cgColor

    }

}
