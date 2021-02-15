//
//  FoodDetail_SubRes.swift
//  HomeCook'd
//
//  Created by admin on 09/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class FoodDetail_SubRes: NSObject {

    let CAT_NAME                 = "category"
    let ITEM_ID                  = "id"
    let ITEM_IMAGE               = "image"
    let ITEM_DESC                = "description"
    let ITEM_PRICE               = "price"
    let ITEM_NAME                 = "name"
    let ALL_ING                   = "all_ingredients"
    let ARR_IMAGES                = "image"
      
    lazy var itemId:Int?  = nil
    lazy var  itemName  = ""
    lazy var  catName  = ""
    lazy var itemDesc  = ""
    lazy var itemPrice:Double?  = nil
    lazy var itemImage  = ""
    lazy var arrAllIngRes = [IngArryStore]()
    lazy var arrImages = [JSON]()

    
    func initWithDictionary(dictionary:[String : JSON]) -> FoodDetail_SubRes {
        
        if let item1 = dictionary[ITEM_ID]?.intValue {
            itemId = item1
        }

        if let item2 = dictionary[ITEM_NAME]?.stringValue {
            itemName = item2
        }
        
        if let item3 = dictionary[ITEM_DESC]?.stringValue {
            itemDesc = item3
        }
        
        if let item4 = dictionary[ITEM_IMAGE]?.stringValue {
            itemImage = item4
        }
                
        if let item5 = dictionary[ITEM_PRICE]?.doubleValue {
            itemPrice = item5
        }

        if let item6 = dictionary[CAT_NAME]?.stringValue {
            catName = item6
        }
        
        if let jsonArr = dictionary[ALL_ING]?.array {
            for i in 0 ..< jsonArr.count {
                let objDic = jsonArr[i].dictionary
                let user = IngArryStore().initWithDictionary(dictionary: objDic!)
                arrAllIngRes.append(user)
            }
        }

        
        if let jsonArr1 = dictionary[ARR_IMAGES]?.array {
                arrImages.append(contentsOf: jsonArr1)
        }


        return self


    }


    
    
    
}
