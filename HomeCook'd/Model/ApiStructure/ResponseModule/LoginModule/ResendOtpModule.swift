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
    let SuccMsg  = "succMsg"
    let ErrMsg  = "errMsg"

    lazy var status:Bool = false
    lazy var sucMsg = ""
    lazy var errMsg = ""

    func initWithDictionary(dictionary:[String : JSON]) -> ResendOtpModule {
       
        if let item1 = dictionary[SuccMsg]?.stringValue {
            sucMsg = item1
        }
        if let item2 = dictionary[Status]?.boolValue {
            status = item2
        }
        if let item3 = dictionary[ErrMsg]?.stringValue {
            errMsg = item3
        }

        return self
    }
}
