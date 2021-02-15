//
//  ReviewListModule.swift
//  HomeCook'd
//
//  Created by admin on 04/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class ReviewListResModule: NSObject {
    
    let DICTDATA = "data"
    let STATUS    = "status"
    
    lazy var status:Bool = false
    lazy var dictRes  = ReviewResSubModel()

    
    func initWithDictionary(dictionary:[String : JSON]) -> ReviewListResModule {
        
        if let item = dictionary[STATUS]?.boolValue {
            status = item
        }
        
        if let item1 = dictionary[DICTDATA]?.dictionary {
            let dict1 = ReviewResSubModel().initWithDictionary(dictionary: item1)
            dictRes = dict1
        }

        return self

        
    }


    
}
