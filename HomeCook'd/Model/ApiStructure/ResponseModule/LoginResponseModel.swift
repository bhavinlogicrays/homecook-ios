//
//  LoginResponseModel.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 20/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK:- Response

class LoginResponseModel:NSObject
{
    let Token =  "token"
    lazy var token      =  ""
    func initWithDictionary(dictionary:[String : JSON]) -> LoginResponseModel {
        if let item = dictionary[Token]?.stringValue {
            token = item
        }
        return self
    }


}
