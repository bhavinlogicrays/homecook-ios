//
//  ReViewVCCell.swift
//  

import UIKit

class ReViewVCCell: UITableViewCell {

    // MARK:- Variables
    // MARK:- UIControls
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblDescr: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    //MARK: - Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        imgView.layer.cornerRadius = imgView.frame.size.height
        
        cellView.layer.cornerRadius = 25.0
        cellView.layer.masksToBounds = true
        cellView.clipsToBounds = false
    }
}

