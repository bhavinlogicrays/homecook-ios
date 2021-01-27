//
//  CommonManager.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 21/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import UIKit

let DELEGATE = UIApplication.shared.delegate as! AppDelegate
let STORYBOARD = UIStoryboard(name: "Main", bundle: nil)
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
var strIsComefrom = String()
var isPayment : Bool = false
let API_SHARED  =  ApiManager.sharedInstance


class CommonManager{
    


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
    class func checkValidation() {
        
    }
    
    //MARK: - UI Methods
    class func setBorder(textField: UITextField) {
        textField.layer.masksToBounds = false
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
    
}


