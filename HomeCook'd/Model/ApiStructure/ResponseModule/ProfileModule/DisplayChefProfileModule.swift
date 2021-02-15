//
//  ProfileResModule.swift
//  HomeCook'd
//
//  Created by admin on 05/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class DisplayChefProfileModule:NSObject {
    
    let  DICT_DATA = "data"
    let STATUS = "status"
    
    lazy var status:Bool = false
    lazy var dictChefRes  = ChefProfileResSubModule()
    
    
    func initWithDictionary(dictionary:[String : JSON]) -> DisplayChefProfileModule {
        
        if let item1 = dictionary[STATUS]?.boolValue {
            status = item1
        }
        
        if let item = dictionary[DICT_DATA]?.dictionary {
            let dict = ChefProfileResSubModule().initWithDictionary(dictionary: item)
            dictChefRes = dict
        }
        return self
    }

    
    
    
}
