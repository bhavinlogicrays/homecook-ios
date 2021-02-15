//
//  DashboardResponse.swift
//  HomeCook'd
//
//  Created by admin on 03/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import  SwiftyJSON

class DashboardResponse:NSObject {
    let DataDict = "data"
    let Status  = "status"

    
    lazy var status:Bool = false
    lazy var dictData = DashboardSubRes()

    func initWithDictionary(dictionary:[String : JSON]) -> DashboardResponse {
        
        if let item = dictionary[Status]?.boolValue {
            status = item
        }
        
        if let item1 = dictionary[DataDict]?.dictionary {
            let dict = DashboardSubRes().initWithDictionary(dictionary: item1)
            dictData = dict
            
        }

        return self

        
    }


    
}
