//
//  FoodDetailRes.swift
//  HomeCook'd
//
//  Created by admin on 09/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class FoodDetailRes:NSObject {
    
    let  DICT_DATA = "data"
    let STATUS = "status"
    
    lazy var status:Bool = false
    lazy var dictFoodDetail  =  FoodDetail_SubRes()

    
    func initWithDictionary(dictionary:[String : JSON]) -> FoodDetailRes {
        
        if let item1 = dictionary[STATUS]?.boolValue {
            status = item1
        }

        if let item = dictionary[DICT_DATA]?.dictionary {
            let dict = FoodDetail_SubRes().initWithDictionary(dictionary: item)
            dictFoodDetail = dict
        }

        return self
    }

    
    
    
}

