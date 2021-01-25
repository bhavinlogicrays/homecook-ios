//
//  collImages.swift
//  HomeCook'd
//
//  Created by Sheela Dodiya on 18/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import UIKit


protocol collImagesDelegate: NSObjectProtocol {
    func didPressOnBackBtn(_ Index: Int)
}

class collImages: UICollectionViewCell {
    
    // MARK: - Variables
    var row = 0
    
    // MARK: - UIControls
    @IBOutlet weak var imgDisplay:UIImageView!
    @IBOutlet weak var lblDelTime: UILabel!

    weak var delegate: (NSObjectProtocol & collImagesDelegate)?
    
    // MARK: - IBAction Methods
    @IBAction func onClickFoodCell(_ sender: UIButton) {
        delegate?.didPressOnBackBtn(row)
    }
}
