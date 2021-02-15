//
//  Dashboard_Reviews.swift
//  HomeCook'd
//
//  Created by admin on 03/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//
import Foundation
import SwiftyJSON

class Dashboard_Reviews:NSObject {
    
    let RATING_AVERAGE                         = "rating_average"
    let RATING_COUNT                            = "rating_count"

    
    lazy var ratingAverage                   = ""
    lazy var ratingCount   :Int?               = nil

    
    
    func initWithDictionary(dictionary:[String : JSON]) -> Dashboard_Reviews {
        if let item1 = dictionary[RATING_AVERAGE]?.stringValue {
            ratingAverage = item1
        }
        
        if let item2 = dictionary[RATING_COUNT]?.intValue {
            ratingCount = item2
        }
        
        return self

    }

}
