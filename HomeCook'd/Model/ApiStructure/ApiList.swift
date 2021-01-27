//
//  ApiList.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 20/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiList:NSObject{
    
    struct URL {
        
        //http://192.168.0.10:8000/api/customerlogin
        static let Host = "https://www.dev.halal.masumparvej.me/api" // Developement
        struct Auth {
            static let loginEndpoint = "/clientgettoken"
        }

    }

}
