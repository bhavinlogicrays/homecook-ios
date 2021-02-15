//
//  RevenueListSubModel.swift
//  HomeCook'd
//
//  Created by admin on 04/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import  SwiftyJSON

class RevenueListSubModel:NSObject {
    
    let  TotalRev = "total_revenue"
    let  RevList = "revenue_list"
    let REVENUE_ITEM_LIST = "item_list"

    lazy var totalReven = ""
    lazy var arrRev = [Dashboard_Revenue]()
    lazy var arrItemList = [Revenue_ItemList]()
    
    
    func initWithDictionary(dictionary:[String : JSON]) -> RevenueListSubModel {
        if let item1 = dictionary[TotalRev]?.stringValue {
            totalReven = item1
        }
        
        if let item2 = dictionary[RevList]?.array {
            for i in 0 ..< item2.count {
                let objDic = item2[i].dictionary
                let user = Dashboard_Revenue().initWithDictionary(dictionary: objDic!)
                arrRev.append(user)
            }
        }

        if let item3 = dictionary[REVENUE_ITEM_LIST]?.array {
            for i in 0 ..< item3.count {
                let objDic1 = item3[i].dictionary
                let user1 = Revenue_ItemList().initWithDictionary(dictionary: objDic1!)
                arrItemList.append(user1)
            }
        }


        return self
        
    }


    
}
