//
//  CommonManager.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 21/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

let DELEGATE = UIApplication.shared.delegate as! AppDelegate
let STORYBOARD = UIStoryboard(name: "Main", bundle: nil)
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
var strIsComefrom = String()
var isPayment : Bool = false
let API_SHARED  =  ApiManager.sharedInstance
var dictData = [String:Any] ()
var displayDictRes  = ChefProfileResSubModule()
var displayMainChefData  = DisplayChefProfileModule()
var dictUserData  = LoginResponseModel()




class CommonManager{
    

    struct Messages {
        static let NoInternet = "Internet connection appears to be offline."
    }

    class func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func DisplayAlertView(titleDisply:String,msg:String){
        AJAlertController.initialization().showAlertWithOkButton(title:titleDisply,message:msg, completion:{(index,title) in
            if index == 0 {
                print("Ok Tapped")
            }
        })
    }
    
    //MARK:- Check  Validation
   class  func validate(password: String) -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: password)
    }

    class  func validatePhone(Phone: String) -> Bool {
//        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"
        let regEx = "^[6-9]\\d{9}$"
        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: Phone)
     }
    
    //MARK: - UI Methods
    class func setBorder(textField: UITextField) {
//        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 10.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1).cgColor
    }

   class  func setCorner(button: UIButton) {
        button.layer.cornerRadius = 10.0
        button.layer.masksToBounds = true
        button.clipsToBounds = false
    }

   class  func setViewCorner(view: UIView) {
        view.layer.cornerRadius = 10.0
        view.layer.masksToBounds = true
        view.clipsToBounds = false
    }
    
    class func setAttributedPlaceholder(msg:String,txtfield:UITextField){
        txtfield.attributedPlaceholder = NSAttributedString(string:msg, attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
    }
    
    
    class func txtfiedSetColor(txtvalue:String,textfield:UITextField) {
        textfield.setRightPaddingPoints(15)
        textfield.setLeftPaddingPoints(15)
        textfield.text = txtvalue
        textfield.textColor  = UIColor(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)
    }
    
    class func txtfiedSetNewColor(textfield:UITextField,hexaCode:String) {
        textfield.textColor  = UIColor.init(hexString: "#\(hexaCode)")
    }
    
    class func txtViewSetColor(txtvalue:String,textView:UITextView) {
        textView.text = txtvalue
        textView.textColor  = UIColor(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)
    }
    class func txtViewSetBlackColor(textView:UITextView,hexaCode:String) {
        textView.textColor  = UIColor.init(hexString: "#\(hexaCode)")
    }

    
    //MARK:- callApi

    class func callChefProfileApi(completionHandler:@escaping((Bool))->Void) {
        let apiUrl = ApiList.URL.Host  + ApiList.URL.ChefProfile.displayChefData
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? ""]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) { (dicResponseWithSuccess ,_)  in
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                        displayMainChefData = DisplayChefProfileModule().initWithDictionary(dictionary:dicResponseData)
                        displayDictRes = displayMainChefData.dictChefRes
                        completionHandler(true)
                    } else {
                        Utils.showMessage(type: .error, message: "Something went wrong!")
                        completionHandler(false)
                    }

                } else {
                }
                
            }
            
    }


    
}



