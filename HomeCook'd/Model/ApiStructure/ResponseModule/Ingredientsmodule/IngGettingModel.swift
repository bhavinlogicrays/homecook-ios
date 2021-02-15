//
//  IngGettingModel.swift
//  HomeCook'd
//
//  Created by admin on 12/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngGettingModel:NSObject{
    let INGREDIENTS = "ingredients"
    let FOOD_TYPE = "food_type"

    lazy var arrGetIng = [IngArryStore]()
    lazy var arrFoodType = [JSON]()

    func initWithDictionary(dictionary:[String : JSON]) -> IngGettingModel {
        if let jsonArr1 = dictionary[INGREDIENTS]?.array {
                for i in 0 ..< jsonArr1.count {
                    let objDic1 = jsonArr1[i].dictionary
                    let user1 = IngArryStore().initWithDictionary(dictionary: objDic1!)
                    arrGetIng.append(user1)
                }
        }

        if let jsonArr2 = dictionary[FOOD_TYPE]?.array {
            arrFoodType = jsonArr2
        }

        return self
    }

}
