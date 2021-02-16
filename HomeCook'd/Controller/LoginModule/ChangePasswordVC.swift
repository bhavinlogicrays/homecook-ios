//
//  ChangePasswordVC.swift
//  HomeCook'd
//
//  Created by admin on 03/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import UIKit
import Alamofire

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var txtNewPassword:UITextField!
    @IBOutlet weak var txtConfirmNewPassord:UITextField!
    @IBOutlet weak var btnSave:UIButton!
    @IBOutlet weak var btnLogin:UIButton!

    lazy var strforgot = String()
    lazy var strEmail = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        SetUI()
    }
    //MARK:- Fuctions
    
    func SetUI() {
        CommonManager.setBorder(textField: txtNewPassword )
        CommonManager.setBorder(textField: txtConfirmNewPassord)
        txtNewPassword.setLeftPaddingPoints(15)
        txtConfirmNewPassord.setLeftPaddingPoints(15)
        CommonManager.setCorner(button: btnSave)

    }
    
    func checkValidation(){
        guard let strNew  = txtNewPassword.text,strNew.count > 0 else {
            Utils.showMessage(type: .error, message: "Please enter new password")
            return
        }
        
       if    txtNewPassword.text!.count < 6   {
            Utils.showMessage(type: .error, message: "Password should contain 6 character")
            return
        }
        guard let strNew3  = txtConfirmNewPassord.text,strNew3.count > 0  else {
            Utils.showMessage(type: .error, message: "Please enter confirm password")
            return
        }

        if   txtConfirmNewPassord.text!.count < 6   {
            Utils.showMessage(type: .error, message: "Password should contain 6 character")
            return
        }

        
        if txtConfirmNewPassord.text != txtNewPassword.text! {
            Utils.showMessage(type: .error, message: "Password not mached")
            return
        }
        callApi()

    }
    
//MARK:- IBACtion
    
    @IBAction func btnSaveClick(_ sender:AnyObject) {
        self.view.endEditing(true)
        checkValidation()
    }

    @IBAction func btnLoginClick(_ sender:AnyObject) {
        self.view.endEditing(true)
        let setlogin = STORYBOARD.instantiateViewController(withIdentifier: "LogInVC") as? LogInVC
        self.navigationController?.pushViewController(setlogin!, animated: true)
    }
    
    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }

    //MARK:- Api Call
    
    func callApi(){
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.changePassword
        let param = ["email":strEmail,
                     "password":txtConfirmNewPassord.text!]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                        if dicResponseData["status"]?.boolValue == true {
                            Utils.showMessage(type: .success, message: "Your password has been updated, please login to continue")
                            let setlogin = STORYBOARD.instantiateViewController(withIdentifier: "LogInVC") as? LogInVC
                            weakSelf.navigationController?.pushViewController(setlogin!, animated: true)
                        }
                        else {
                            Utils.showMessage(type: .error, message:dicResponseData["errMsg"]?.string ?? "")
                        }
                        
                    } else {
                        Utils.showMessage(type: .error, message: "Something went wrong!")
                    }

                } else {
                    Utils.showMessage(type: .error, message: "Something went wrong!")
                }

            }

    }
        
    }
    
}
