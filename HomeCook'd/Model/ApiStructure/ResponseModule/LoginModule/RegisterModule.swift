//
//  RegisterModule.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 29/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON


class RegisterModule:NSObject
{
    let Status  = "status"
    let Msg = "succMsg"
    
    lazy var status:Bool = false
    lazy var msg      =  ""

    func initWithDictionary(dictionary:[String : JSON]) -> RegisterModule {
        if let item3 = dictionary[Status]?.boolValue {
            status = item3
        }
        if let item4 = dictionary[Msg]?.stringValue {
            msg = item4
        }
        return self
    }

}
