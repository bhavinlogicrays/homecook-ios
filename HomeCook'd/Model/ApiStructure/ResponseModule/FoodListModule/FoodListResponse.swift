//
//  FoodListResponse.swift
//  HomeCook'd
//
//  Created by admin on 08/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//



import Foundation
import SwiftyJSON


class FoodListResponse:NSObject {

    
    let CAT_NAME                 = "category_name"
    let ITEM_ID                  = "id"
    let ITEM_IMAGE               = "image"
    let ITEM_NAME                = "name"
    let ITEM_PRICE               = "price"
    let ITEM_VAT                 = "vat"
   
    
    lazy var catName       = ""
    lazy var itemId            = ""
    lazy var itemImage        = ""
    lazy var itemName             = ""
    lazy var itemPrice:Double?    = nil
    lazy var vat:Int?          = nil
    

    func initWithDictionary(dictionary:[String : JSON]) -> FoodListResponse {
        
        if let item1 = dictionary[CAT_NAME]?.stringValue {
            catName = item1
        }
        
        if let item2 = dictionary[ITEM_ID]?.stringValue {
            itemId = item2
        }
        
        if let item3 = dictionary[ITEM_IMAGE]?.stringValue {
            itemImage = item3
        }
                
        if let item6 = dictionary[ITEM_NAME]?.stringValue {
            itemName = item6
        }
        
        if let item7 = dictionary[ITEM_PRICE]?.doubleValue {
            itemPrice = item7
        }
        if let item8 = dictionary[ITEM_VAT]?.intValue {
            vat = item8
        }
        
      

        return self
    }

    
    
}
