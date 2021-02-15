//
//  IngResponseSubModule.swift
//  HomeCook'd
//
//  Created by admin on 09/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngResponseSubModule:NSObject {
    
    let ING_NAME                  = "name"
    let ING_ID                    = "id"
    let ING_IMAGE                 = "image"
    let IS_SEL                    = "is_selected"
    
    lazy var  ingName  = ""
    lazy var  ingId = ""
    lazy var ingImage  = ""
    lazy var isSelected:Int?  = nil

    
    func initWithDictionary(dictionary:[String : JSON]) -> IngResponseSubModule {
        
        if let item1 = dictionary[IS_SEL]?.intValue {
            isSelected = item1
        }

        if let item2 = dictionary[ING_NAME]?.stringValue {
            ingName = item2
        }
        
        if let item3 = dictionary[ING_ID]?.stringValue {
            ingId = item3
        }
        
        if let item4 = dictionary[ING_IMAGE]?.stringValue {
            ingImage = item4
        }
        return self


    }


    
}
