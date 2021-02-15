//
//  DashboardSubRes.swift
//  HomeCook'd
//
//  Created by admin on 03/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class DashboardSubRes:NSObject {
    
    let TOTAL_RUNNING_ORDERS                     = "total_runing_order"
    let TOTAL_REQUESTED_ORDERS                   = "total_requested_order"
    let TOTAL_REVENUE                            = "total_revenue"
    let REVENUE_LIST                             = "revenue_list"
    let REVIEWS                                  = "reviews"
    let POPLUAR_ITEMS                            = "popular_items"

    
    lazy var total_runing_order      :Int?               = nil
    lazy var total_requested_order   :Int?               = nil
    lazy var total_revenue                                 = ""
    lazy var revenue_list = [Dashboard_Revenue]()
    lazy var reviews = Dashboard_Reviews()
    lazy var popular_items  = [Dashboard_PopularItem]()

    
    
    func initWithDictionary(dictionary:[String : JSON]) -> DashboardSubRes {
        if let item1 = dictionary[TOTAL_RUNNING_ORDERS]?.intValue {
            total_runing_order = item1
        }
        
        if let item2 = dictionary[TOTAL_REQUESTED_ORDERS]?.intValue {
            total_requested_order = item2
        }
        
        if let item3 = dictionary[TOTAL_REVENUE]?.stringValue {
            total_revenue = item3
        }

        if let item4 = dictionary[REVENUE_LIST]?.array {
            for i in 0 ..< item4.count {
                let objDic = item4[i].dictionary
                let user = Dashboard_Revenue().initWithDictionary(dictionary: objDic!)
                revenue_list.append(user)
            }
        }
        
        if let item5 = dictionary[REVIEWS]?.dictionary {
            let user = Dashboard_Reviews().initWithDictionary(dictionary: item5)
            reviews = user

        }
        
        
        if let item6 = dictionary[POPLUAR_ITEMS]?.array {
            for i in 0 ..< item6.count {
                let objDic = item6[i].dictionary
                let user = Dashboard_PopularItem().initWithDictionary(dictionary: objDic!)
                popular_items.append(user)
            }

        }
        
        return self

    }

}
