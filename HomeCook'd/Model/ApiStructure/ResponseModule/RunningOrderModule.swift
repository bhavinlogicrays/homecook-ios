//
//  RunningOrderModule.swift
//  HomeCook'd
//
//  Created by admin on 02/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class RunningOrderModule:NSObject {
    let Arr_Running_Order = "data"
    let Status  = "status"
    let DataCount  = "dataCount"

    lazy var arrRunningOrder = [RunningOrderSubModule]()
    lazy var status:Bool = false
    lazy var datacount = ""
    
    func initWithDictionary(dictionary:[String : JSON]) -> RunningOrderModule {
        
        if let item = dictionary[Status]?.boolValue {
            status = item
        }
        
        if let item1 = dictionary[DataCount]?.stringValue {
            datacount = item1
        }

        
        if let jsonArr = dictionary[Arr_Running_Order]?.array {
            for i in 0 ..< jsonArr.count {
                let objDic = jsonArr[i].dictionary
                let user = RunningOrderSubModule().initWithDictionary(dictionary: objDic!)
                arrRunningOrder.append(user)
            }
        }
        return self

        
    }

    
}
