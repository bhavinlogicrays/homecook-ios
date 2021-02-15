//
//  ForgotPassWordVC.swift
//

import UIKit
import Alamofire

class ForgotPassWordVC: UIViewController,UITextFieldDelegate {

    // MARK:- Variables
    
    // MARK:- UIControls
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSendCode: UIButton!
    
    var txtTemp: UITextField!
    lazy var dicForgotPassword = ForgotPasswordResponseModel()
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
    }
    
    // MARK: - UI Methods
    func setUI() {
        txtEmail.keyboardType = UIKeyboardType.emailAddress
        
        CommonManager.setBorder(textField: txtEmail)
        CommonManager.setCorner(button: btnSendCode)
    
        txtEmail.attributedPlaceholder = NSAttributedString(string:"example@gmail.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEmail.setRightPaddingPoints(15)
        txtEmail.setLeftPaddingPoints(15)
        
        txtEmail.keyboardType = .emailAddress
        txtEmail.becomeFirstResponder()
    }
    
    // MARK: - IBAction Methods
    
    @IBAction func onClickBack(_ sender: Any) {
        self.view.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickSendCode(_ sender: UIButton) {
//        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PassWordVarificationVC") as! PassWordVarificationVC
//        self.navigationController?.pushViewController(objVC, animated: true)
        self.view.endEditing(true)
        checkValidation()
        
    }
    
    // MARK: - Delegate Methods
    // MARK: UITextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtTemp = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtTemp.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtTemp.text = txtTemp.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        txtTemp.resignFirstResponder()
        txtTemp = nil
    }
    
    //MARK:- CheckValidation
    func checkValidation() {
        self.view.endEditing(true)
        guard let stremail = txtEmail.text,  stremail.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter email")
        return
    }
        if !CommonManager.isValidEmail(txtEmail.text!){
            Utils.showMessage(type: .error, message:"Please enter valid email")
            return
        }
        callApi()
       
    }
       
    //MARK:- Api Call
    func callApi(){
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.forgotPasswordEndpoint
        let param = ["email":txtEmail.text!]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                    
                        weakSelf.dicForgotPassword = ForgotPasswordResponseModel().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dicForgotPassword.status == true {

                            Utils.showMessage(type:.success, message: weakSelf.dicForgotPassword.succmsg)
                            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PassWordVarificationVC") as! PassWordVarificationVC
                            objVC.iscomeForgot = "forgot"
                            objVC.getEmail = weakSelf.txtEmail.text!
                            weakSelf.navigationController?.pushViewController(objVC, animated: true)
                        }
                        else {
                            Utils.showMessage(type: .error, message:dicResponseData["errMsg"]?.string ?? "")
                        }
                    } else {}

                } else {
                }
                
            }
            }
        
        
    }
}
    

