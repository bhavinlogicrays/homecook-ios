//
//  UserProfileResSubModule.swift
//  HomeCook'd
//
//  Created by admin on 05/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

class ChefProfileResSubModule:NSObject {
    let CHEF_ID  = "id"
    let CHEF_NAME  = "name"
    let CHEF_PHONE  = "phone"
    let CHEF_EMAIL  = "email"
    let CHEF_HOURS_FROM = "hours_from"
    let CHEF_HOURS_TO = "hours_to"
    let PROFILE_PIC = "profile_pic"


    lazy var chefId:Int?  = nil
    lazy var  chefName  = ""
    lazy var  chefPhone  = ""
    lazy var chefEmail  = ""
    lazy var chefHoursfrom  = ""
    lazy var chefHoursto  = ""
    lazy var profilePic = ""

    
    func initWithDictionary(dictionary:[String : JSON]) -> ChefProfileResSubModule {
        
        if let item1 = dictionary[CHEF_ID]?.intValue {
            chefId = item1
        }

        if let item2 = dictionary[CHEF_NAME]?.stringValue {
            chefName = item2
        }
        
        if let item3 = dictionary[CHEF_PHONE]?.stringValue {
            chefPhone = item3
        }
        
        if let item4 = dictionary[CHEF_EMAIL]?.stringValue {
            chefEmail = item4
        }
        
        
        if let item6 = dictionary[CHEF_HOURS_FROM]?.stringValue {
            chefHoursfrom = item6
        }

        if let item7 = dictionary[CHEF_HOURS_TO]?.stringValue {
            chefHoursto = item7
        }
        if let item8 = dictionary[PROFILE_PIC]?.stringValue {
            profilePic = item8
        }
        
        return self


    }

    
    
    
    
}


