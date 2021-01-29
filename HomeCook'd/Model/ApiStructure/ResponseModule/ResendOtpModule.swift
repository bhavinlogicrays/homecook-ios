//
//  ResendOtpModule.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 29/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK:- Response

class ResendOtpModule:NSObject

{
    let Status  = "status"
    let ErrorMsg  = "succMsg"

    lazy var status:Bool = false
    lazy var errormsg = ""

    func initWithDictionary(dictionary:[String : JSON]) -> ResendOtpModule {
       
        if let item1 = dictionary[ErrorMsg]?.stringValue {
            errormsg = item1
        }
        if let item2 = dictionary[Status]?.boolValue {
            status = item2
        }
        return self
    }
}
