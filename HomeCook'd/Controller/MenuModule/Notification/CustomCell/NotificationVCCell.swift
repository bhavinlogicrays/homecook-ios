//
//  NotificationVCCell.swift
//

import UIKit

class NotificationVCCell: UITableViewCell {

    // MARK: - Variables
    // MARK: - UI Controls
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    
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
