//
//  RadioButtonManage.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 28/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import UIKit

class RadioButtonManage: NSObject {
    var buttonsArray: [UIButton]! {
        didSet {
            for b in buttonsArray {
                b.setImage(UIImage(named: "icons8-round-50"), for: .normal)
                b.setImage(UIImage(named: "radio button"), for: .selected)
            }
        }
    }
    var selectedButton: UIButton?
    var defaultButton: UIButton = UIButton() {
        didSet {
            buttonArrayUpdated(buttonSelected: self.defaultButton)
        }
    }

    func buttonArrayUpdated(buttonSelected: UIButton) {
        for b in buttonsArray {
            if b == buttonSelected {
                selectedButton = b
                b.isSelected = true
            } else {
                b.isSelected = false
            }
        }
    }
}
