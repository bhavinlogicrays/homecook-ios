//
//  RevenueList.swift
//  HomeCook'd
//
//  Created by admin on 04/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import  SwiftyJSON

class RevenueList:NSObject {
    let DataDict = "data"
    let Status  = "status"
    
    lazy var status:Bool = false
    lazy var dictData = RevenueListSubModel()
    
    func initWithDictionary(dictionary:[String : JSON]) -> RevenueList {
        if let item1 = dictionary[Status]?.boolValue {
            status = item1
        }
        
        if let item2 = dictionary[DataDict]?.dictionary {
            let dict = RevenueListSubModel().initWithDictionary(dictionary: item2)
            dictData = dict
        }
        
        return self

    }

    
}

