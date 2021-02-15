//
//  IngModule.swift
//  HomeCook'd
//
//  Created by admin on 09/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngModule:NSObject {
    
    let  DICT_DATA = "data"
    let STATUS = "status"
    
    lazy var status:Bool = false
    lazy var dictAllIng  = IngGettingModel()
    
    func initWithDictionary(dictionary:[String : JSON]) -> IngModule {
        
        if let item1 = dictionary[STATUS]?.boolValue {
            status = item1
        }

        if let item = dictionary[DICT_DATA]?.dictionary {
            
            let dict = IngGettingModel().initWithDictionary(dictionary: item)
            dictAllIng = dict
        }

        return self
    }


    
    
}
