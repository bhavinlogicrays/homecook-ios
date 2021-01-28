//
//  ResendApiModel.swift
//  HomeCook'd
//
//  Created by admin on 28/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK:- Response

class ResendOTPResponseModel:NSObject

{
    let Status  = "status"
    let ErrorMsg  = "succMsg"

    lazy var status:Bool = false
    lazy var errormsg = ""

    func initWithDictionary(dictionary:[String : JSON]) -> ResendOTPResponseModel {
       
        if let item1 = dictionary[ErrorMsg]?.stringValue {
            errormsg = item1
        }
        if let item2 = dictionary[Status]?.boolValue {
            status = item2
        }
        return self
    }
}
