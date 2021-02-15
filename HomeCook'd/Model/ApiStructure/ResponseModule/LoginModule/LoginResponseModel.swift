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
    let Name =  "name"
    let Email =  "email"
    let Id = "id"
    let Status  = "status"
    let IsChef = "is_chef"
    let User_Status  = "user_status"
    let PROFILE_PIC  = "profile_pic"
    
    lazy var token      =  ""
    lazy var email      =  ""
    lazy var name      =  ""
    lazy var id        =  ""
    lazy var ischef     =  ""
    lazy var status:Bool = false
    lazy var userStatus  = ""
    lazy var profilePic = ""
    
    func initWithDictionary(dictionary:[String : JSON]) -> LoginResponseModel {
        if let item = dictionary[Token]?.stringValue {
            token = item
        }
        if let item2 = dictionary[email]?.stringValue {
            email = item2
        }
        if let item1 = dictionary[Name]?.stringValue {
            name = item1
        }
        if let item3 = dictionary[Status]?.boolValue {
            status = item3
        }
        if let item4 = dictionary[IsChef]?.stringValue {
            ischef = item4
        }
        if let item5 = dictionary[Id]?.stringValue {
            id = item5
        }

        if let item6 = dictionary[User_Status]?.stringValue {
            userStatus = item6
        }


        return self
    }


}
