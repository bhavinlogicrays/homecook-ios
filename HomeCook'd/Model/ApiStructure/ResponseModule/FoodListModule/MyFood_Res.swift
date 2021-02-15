//
//  MyFood_Res.swift
//  HomeCook'd
//
//  Created by admin on 08/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class MyFood_Res:NSObject {
    
    let  DICT_DATA = "data"
    let STATUS = "status"
    let FOOD_TYPE = "food_type"
    
    lazy var status:Bool = false
    lazy var arrFoodRes  = [FoodListResponse]()
    lazy var arrFoodCat  = [JSON]()

    
    func initWithDictionary(dictionary:[String : JSON]) -> MyFood_Res {
        
        if let item1 = dictionary[STATUS]?.boolValue {
            status = item1
        }
        if let jsonArr = dictionary[DICT_DATA]?.array {
            for i in 0 ..< jsonArr.count {
                let objDic = jsonArr[i].dictionary
                let user = FoodListResponse().initWithDictionary(dictionary: objDic!)
                arrFoodRes.append(user)
            }
        }
        if let jsonArr1 = dictionary[FOOD_TYPE]?.array {
                arrFoodCat.append(contentsOf: jsonArr1)
        }
        return self
    }
    
}

