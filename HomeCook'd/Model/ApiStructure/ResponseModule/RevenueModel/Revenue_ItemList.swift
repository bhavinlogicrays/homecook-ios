//
//  Revenue_ItemList.swift
//  HomeCook'd
//
//  Created by admin on 04/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class Revenue_ItemList:NSObject {
//    {
//                    "id": 7,
//                    "name": "Mozzarella Pizza",
//                    "image": "https://www.dev.halal.masumparvej.me/uploads/settings/no-image.png",
//                    "category_name": "Pizza",
//                    "item_sale_count": 38
//                },
    
    
    let ITEM_SALE_COUNT                 = "item_sale_count"
    let REVENUE_ITEM_ID                         = "id"
    let ITEM_IMAGE                 = "image"
    let ITEM_NAME                  = "name"
    let ITEM_CATEGORY_NAME              = "category_name"
   
    
    lazy var saleCount:Int?       = nil
    lazy var itemId:Int?         = nil
    lazy var itemImage        = ""
    lazy var itemName             = ""
    lazy var catname          = ""
    

    func initWithDictionary(dictionary:[String : JSON]) -> Revenue_ItemList {
        
        if let item1 = dictionary[ITEM_SALE_COUNT]?.intValue {
            saleCount = item1
        }
        
        if let item2 = dictionary[REVENUE_ITEM_ID]?.intValue {
            itemId = item2
        }
        
        if let item3 = dictionary[ITEM_IMAGE]?.stringValue {
            itemImage = item3
        }
                
        if let item6 = dictionary[ITEM_NAME]?.stringValue {
            itemName = item6
        }
        
        if let item8 = dictionary[ITEM_CATEGORY_NAME]?.stringValue {
            catname = item8
        }

        return self
    }
    
}
