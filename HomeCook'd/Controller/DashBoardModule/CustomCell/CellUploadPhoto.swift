//
//  CellUploadPhoto.swift
//  HomeCook'd
//
//  Created by admin on 12/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import UIKit

class CellUploadPhoto: UICollectionViewCell {
    @IBOutlet weak var imgIngrs: UIImageView!
    @IBOutlet weak var imgVideoIcon: UIImageView!
    @IBOutlet weak var btnPicker: UIButton!

    override func awakeFromNib() {
        imgIngrs.layer.cornerRadius  = imgIngrs.frame.size.width / 2
        imgIngrs.layer.borderWidth  = 1
        imgIngrs.layer.borderColor = UIColor.clear.cgColor
        
    }

}
