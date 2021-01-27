//
//  MessegeVCCell.swift
//

import UIKit

class MessegeVCCell: UITableViewCell {

    // MARK: - Variables
    // MARK: - UI Controls
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCmnt: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblNum: UILabel!
    
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
