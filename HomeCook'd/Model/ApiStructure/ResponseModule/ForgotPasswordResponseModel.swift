//
//  ForgotPasswordResponseModel.swift
//  HomeCook'd
//
//  Created by admin on 27/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK:- Response

class ForgotPasswordResponseModel:NSObject
{
    let Status  = "status"
    let SuccessMsg  = "succMsg"

    lazy var status:Bool = false
    lazy var succmsg = ""

    func initWithDictionary(dictionary:[String : JSON]) -> ForgotPasswordResponseModel {
       
        if let item1 = dictionary[SuccessMsg]?.stringValue {
            succmsg = item1
        }
        if let item2 = dictionary[Status]?.boolValue {
            status = item2
        }
        return self
    }


}
