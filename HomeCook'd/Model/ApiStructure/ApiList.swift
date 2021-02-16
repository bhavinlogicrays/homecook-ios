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
            
            static let loginEndpoint = "/login"
            static let registerEndpoint = "/chef/register"
            static let forgotPasswordEndpoint = "/forgot"
            static let forgot_VarificationEndpoint = "/verificationcode"
            static let resendOTPEndpoint = "/resendotp"
            static let changePassword = "/resetpassword"

        }
        //Mark:-ChfApi
        struct OrderList{
            static let orderReqList = "/orderlist"
            static let orderReqStatus = "/changeorderstatus"
        }
        
        struct Dashboard {
            static let dashboardView  = "/chefdashboardview"
        }

        struct  Revenue {
            static let revenueList  = "/revenuelist"
        }
        
        struct  Review {
            static let reviewList  = "/reviewlist"
        }
        struct  FoodList {
            static let myfoodList  = "/myfoodlist"
            static let foodDetail  = "/fooddetail"

        }
        struct ChefProfile{
            static let displayChefData  = "/userprofile"
            static let editProfile = "/updateuserprofile"
        }
        
        struct AddUpdateItem{
            static let addItem  = "/addnewfooditem"
            static let updateItem = "/updatefooddetail"

        }
        struct AllIngredientsList {
        static let allIng  = "/ingredientslist"

        }
    }

}
