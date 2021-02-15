//
//  RunningOrderSubModule.swift
//  HomeCook'd
//
//  Created by admin on 02/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class RunningOrderSubModule:NSObject {
//    "order_id": 546,
//    "chef_name": "Leuka Pizza",
//    "chef_id": 1,
//    "created": "2021-01-10T23:44:34.000000Z",
//    "last_status": "accepted_by_restaurant",
//    "client_name": "Demo Client 2",
//    "client_id": 5,
//    "table_name": "",
//    "table_id": null,
//    "area_name": "",
//    "area_id": null,
//    "address": "1923 Kim Gateway\nHumbertostad, AZ 24246-5555",
//    "address_id": 1,
//    "order_value": 55.97,
//    "order_delivery": 6,
//    "order_total": 61.97,
//    "payment_method": null,
//    "srtipe_payment_id": null
    
    
    let ORDER_ID                 = "order_id"
    let CHEF_NAME                = "chef_name"
    let CHEF_ID                  = "chef_id"
    let CREATED                  = "created"
    let LAST_STATUS              = "last_status"
    let CLIENT_NAME              = "client_name"
    let CLIENT_ID                = "client_id"
    let TABLE_NAME               = "table_name"
    let TABLE_ID                 = "table_id"
    let AREA_NAME                = "area_name"
    let AREA_ID                  = "area_id"
    let ADDRESS                  = "address"
    let ADDRESS_ID               = "address_id"
    let ORDER_VALUE              = "order_value"
    let ORDER_DELIVERY           = "order_delivery"
    let ORDER_TOTAL              = "order_total"
    let PAYMENT_METHOD           = "payment_method"
    let STRIPE_PAYMENT_ID        = "srtipe_payment_id"
    
    lazy var orderId:Int?        = nil
    lazy var chefName            = ""
    lazy var chefId:Int?         = nil
    lazy var created             = ""
    lazy var laststatus          = ""
    lazy var clientName          = ""
    lazy var clientID:Int?       = nil
    lazy var tableName           = ""
    lazy var tableId:Int?        = nil
    lazy var areaName            = ""
    lazy var areaId:Int?          = nil
    lazy var address              = ""
    lazy var addressId:Int?       = nil
    lazy var orderValue:Double?   = nil
    lazy var orderDelivery:Int?  = nil
    lazy var orderTotal:Double?     = nil
    lazy var paymentMethod       = ""
    lazy var stripePaymentId:Int?     = nil

    func initWithDictionary(dictionary:[String : JSON]) -> RunningOrderSubModule {
        
        if let item1 = dictionary[CHEF_NAME]?.stringValue {
            chefName = item1
        }
        
        if let item2 = dictionary[ORDER_ID]?.intValue {
            orderId = item2
        }
        
        if let item3 = dictionary[CHEF_ID]?.intValue {
            chefId = item3
        }
        
        if let item4 = dictionary[CREATED]?.stringValue {
            created = item4
        }
        
        if let item5 = dictionary[LAST_STATUS]?.stringValue {
            laststatus = item5
        }
        
        if let item6 = dictionary[CLIENT_NAME]?.stringValue {
            clientName = item6
        }
        
        if let item7 = dictionary[CLIENT_ID]?.intValue {
            clientID = item7
        }
        if let item8 = dictionary[TABLE_NAME]?.stringValue {
            tableName = item8
        }
        if let item9 = dictionary[TABLE_ID]?.intValue {
            tableId = item9
        }
        if let item10 = dictionary[AREA_NAME]?.stringValue {
            areaName = item10
        }
        
        if let item18 = dictionary[AREA_ID]?.intValue {
            areaId = item18
        }
        
        if let item11 = dictionary[ADDRESS]?.stringValue {
            address = item11
        }
        if let item12 = dictionary[ADDRESS_ID]?.intValue {
            addressId = item12
        }
        if let item13 = dictionary[ORDER_VALUE]?.doubleValue {
            orderValue = item13
        }
        if let item14 = dictionary[ORDER_DELIVERY]?.intValue {
            orderDelivery = item14
        }
        if let item15 = dictionary[ORDER_TOTAL]?.doubleValue {
            orderTotal = item15
        }
        if let item16 = dictionary[PAYMENT_METHOD]?.stringValue {
            paymentMethod = item16
        }
        if let item17 = dictionary[STRIPE_PAYMENT_ID]?.intValue {
            stripePaymentId = item17
        }

        return self
    }

    
    
}

