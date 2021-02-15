//
//  ReviewResdict.swift
//  HomeCook'd
//
//  Created by admin on 05/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class ReviewResdict:NSObject{
    
    let REVIEW_DATE                    = "added_date"
    let REVIEW_ORDER_ID                = "order_id"
    let REVIEW_COMMENT                 = "comment"
    let REVIEW_RATTING                  = "rating"
    let IMAGE                          = "image"
   
    
    lazy var reviewDate              = ""
    lazy var orderId:Int?            = nil
    lazy var comment                 = ""
    lazy var rating:Int?             = nil
    lazy var image                   = ""
    
    
    func initWithDictionary(dictionary:[String : JSON]) -> ReviewResdict {
        
        if let item = dictionary[REVIEW_DATE]?.stringValue {
            reviewDate = item
        }

        if let item1 = dictionary[REVIEW_ORDER_ID]?.intValue {
            orderId = item1
        }

        if let item2 = dictionary[REVIEW_COMMENT]?.stringValue {
            comment = item2
        }
        
        if let item3 = dictionary[REVIEW_RATTING]?.intValue {
            rating = item3
        }
        
        if let item4 = dictionary[IMAGE]?.stringValue {
            image = item4
        }

        return self

    }


}
