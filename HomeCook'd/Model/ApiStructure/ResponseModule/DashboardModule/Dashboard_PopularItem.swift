//
//  Dashboard_PopularItem.swift
//  HomeCook'd
//
//  Created by admin on 03/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON



/*
 "sale_count": "76",
                 "id": 7,
                 "image": "https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8",
                 "name": "Mozzarella Pizza",
                 "price": 10.99,
                 "vat": 21
 */

class Dashboard_PopularItem:NSObject {

    
    let SALE_COUNT                 = "sale_count"
    let ITEM_ID                         = "id"
    let ITEM_IMAGE                 = "image"
    let ITEM_NAME                  = "name"
    let ITEM_PRICE              = "price"
    let ITEM_VAT              = "vat"
   
    
    lazy var saleCount       = ""
    lazy var itemId            = ""
    lazy var itemImage        = ""
    lazy var itemName             = ""
    lazy var itemPrice:Double?    = nil
    lazy var vat:Int?          = nil
    

    func initWithDictionary(dictionary:[String : JSON]) -> Dashboard_PopularItem {
        
        if let item1 = dictionary[SALE_COUNT]?.stringValue {
            saleCount = item1
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
