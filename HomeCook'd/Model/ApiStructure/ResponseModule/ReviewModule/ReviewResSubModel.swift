//
//  File.swift
//  HomeCook'd
//
//  Created by admin on 05/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class ReviewResSubModel:NSObject{
    
    let ARR_REVIEWS  = "reviews"
    let DICT_REVIEW_COUNT  = "review_count"

    lazy var arrReviews  = [ReviewResdict]()
    lazy var dictreviewCount = Dashboard_Reviews()
    
    func initWithDictionary(dictionary:[String : JSON]) -> ReviewResSubModel {
        
        if let item1 = dictionary[ARR_REVIEWS]?.array {
            for i in 0 ..< item1.count {
                let objDic1 = item1[i].dictionary
                let user1 = ReviewResdict().initWithDictionary(dictionary: objDic1!)
                arrReviews.append(user1)
            }
        }
        
        if let item2 = dictionary[DICT_REVIEW_COUNT]?.dictionary {
            let dict = Dashboard_Reviews().initWithDictionary(dictionary: item2)
            dictreviewCount = dict
        }

        return self

        
    }


}
