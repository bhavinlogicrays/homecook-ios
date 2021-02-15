//
//  Dashboard_Revenue.swift
//  HomeCook'd
//
//  Created by admin on 03/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON


class Dashboard_Revenue:NSObject {
    let REVENUE = "revenue"
    let TOTAL_COUNT = "total_count"
    let ADDED_DATE  = "added_date"
    
    lazy var revenue:Int?        = nil
    lazy var totalCount:Int?            = nil
    lazy var addedDate         = ""

    func initWithDictionary(dictionary:[String : JSON]) -> Dashboard_Revenue {
        if let item1 = dictionary[REVENUE]?.intValue {
            revenue = item1
        }
        
        if let item2 = dictionary[TOTAL_COUNT]?.intValue {
            totalCount = item2
        }
        
        if let item3 = dictionary[ADDED_DATE]?.stringValue {
            addedDate = item3
        }
        return self
    }

    
}
