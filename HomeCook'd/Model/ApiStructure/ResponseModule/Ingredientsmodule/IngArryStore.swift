//
//  IngArryStore.swift
//  HomeCook'd
//
//  Created by admin on 09/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngArryStore:NSObject{
    let ING_TYPE = "ingredient_type"
    let ING_LIST = "ingredient_list"
    let IS_EXPANDABLE = ""

    lazy var strIngType = ""
    lazy var arrIngList = [IngResponseSubModule]()
    lazy var isExp = "0"

    
    func initWithDictionary(dictionary:[String : JSON]) -> IngArryStore {
        
        if let item = dictionary[ING_TYPE]?.stringValue {
            strIngType = item
        }
        if let jsonArr1 = dictionary[ING_LIST]?.array {
                for i in 0 ..< jsonArr1.count {
                    let objDic1 = jsonArr1[i].dictionary
                    let user1 = IngResponseSubModule().initWithDictionary(dictionary: objDic1!)
                    arrIngList.append(user1)
                }
        }
        return self
    }



}
