//
//  UISwitchCustom.swift
//  HomeCook'd
//
//  Created by admin on 08/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class UISwitchCustom: UISwitch {
    @IBInspectable var OffTint: UIColor? {
        didSet {
            self.tintColor = OffTint
            self.layer.cornerRadius = 16
            self.backgroundColor = OffTint
        }
    }
}
