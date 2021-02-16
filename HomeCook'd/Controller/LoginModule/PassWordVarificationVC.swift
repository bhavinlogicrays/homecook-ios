//
//  PassWordVarificationVC.swift
//


import UIKit
import Alamofire

class PassWordVarificationVC: UIViewController,UITextFieldDelegate {

    // MARK:- Variables
    // MARK:- UIControls
    @IBOutlet weak var lblVerification: UILabel!
    @IBOutlet weak var txtCode1: UITextField!
    @IBOutlet weak var txtCode2: UITextField!
    @IBOutlet weak var txtCode3: UITextField!
    @IBOutlet weak var txtCode4: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var btnResend: UIButton!
    @IBOutlet weak var lblDisplaySec: UILabel!

    var txtTemp: UITextField!
    lazy var dicForgotVarification = VerificationResponseModel()
    lazy var dicResend = ResendOtpModule()
    var getEmail =  String()
    var iscomeForgot:String = ""
    var count = 50  // 60sec if you want
    var resendTimer = Timer()


    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }
    
    // MARK: - UI Methods
    func setUI() {
        txtCode1.keyboardType = UIKeyboardType.numberPad
        txtCode2.keyboardType = UIKeyboardType.numberPad
        txtCode3.keyboardType = UIKeyboardType.numberPad
        txtCode4.keyboardType = UIKeyboardType.numberPad
        
        txtCode1.becomeFirstResponder()
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.getAppFont(of: .normal, size: 16), NSAttributedString.Key.foregroundColor : UIColor.lightGray]
        let attrs2 = [NSAttributedString.Key.font : UIFont.getAppFont(of: .normal, size: 16), NSAttributedString.Key.foregroundColor : UIColor.darkGray]
        
        let attributedString1 = NSMutableAttributedString(string:"We have sent a code to your email ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:getEmail, attributes:attrs2)
        attributedString1.append(attributedString2)

        self.lblVerification.attributedText =  attributedString1
        btnResend.isUserInteractionEnabled = false
        resendTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)

        CommonManager.setBorder(textField: txtCode1)
        CommonManager.setBorder(textField: txtCode2)
        CommonManager.setBorder(textField: txtCode3)
        CommonManager.setBorder(textField: txtCode4)
        CommonManager.setCorner(button: btnVerify)
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickVerify(_ sender: Any) {
//        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TabVC") as! TabVC
//        self.navigationController?.pushViewController(objVC, animated: true)
        self.view.endEditing(true)
        guard let strCode1 = txtCode1.text,  strCode1.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter verification code")
        return
    }
        guard let strCode2 = txtCode2.text,  strCode2.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter verification code")
            return
        }
        guard let strCode3 = txtCode3.text,  strCode3.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter verification code")
            return
        }
        guard let strCode4 = txtCode4.text,  strCode4.count > 0 else {
                        Utils.showMessage(type: .error, message:"Please enter verification code")
            return
        }

        if self.iscomeForgot == "" {
            self.iscomeForgot = "register"
        }
        callApi(strCome: self.iscomeForgot)
    }
    
    @IBAction func onClickResend(_ sender: Any) {
        self.view.endEditing(true)
        callResendApi()
//        callResendApi()
    }
    @objc func update() {
        if(count > 0) {
            count = count - 1
            print(count)
            lblDisplaySec.text = "in \(count) sec"
        }
        else {
            lblDisplaySec.text =  ""
            btnResend.isUserInteractionEnabled = true
            btnResend.setTitleColor(UIColor.red, for: .normal)
            resendTimer.invalidate()
            print("call your api")
            // if you want to reset the time make count = 60 and resendTime.fire()
        }
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxlenghth = 1
        let currentString: NSString = txtTemp.text! as NSString

        if txtTemp.text!.count < 1  && string.count > 0{
               let nextTag = txtTemp.tag + 1

               // get next responder
            let nextResponder = txtTemp.superview?.viewWithTag(nextTag)

               if (nextResponder == nil){

//                   nextResponder = txtTemp.superview?.viewWithTag(0)
                nextResponder?.endEditing(true)
               }
               txtTemp.text = string
               nextResponder?.becomeFirstResponder()
               return false
           }
           else if txtTemp.text!.count >= 0  && string.count == 0{
               // on deleting value from Textfield
               let previousTag = txtTemp.tag - 1
               // get next responder
               var previousResponder = txtTemp.superview?.viewWithTag(previousTag)
               if (previousResponder == nil){
                   previousResponder = txtTemp.superview?.viewWithTag(0)
               }
                txtTemp.text = ""
               previousResponder?.becomeFirstResponder()
               return false
           }
//           return true
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxlenghth

    }

    //MARK:- Api Call
    func callApi(strCome:String){
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()

        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.forgot_VarificationEndpoint
        let param = ["email":getEmail,
                     "verification_code":txtCode1.text! + txtCode2.text! + txtCode3.text! + txtCode4.text!, "verified_from":strCome]
        let header:HTTPHeaders = ["Content-Type":"application/json"]

        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {

                        weakSelf.dicForgotVarification = 
                        VerificationResponseModel().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dicForgotVarification.status == true {

                            if weakSelf.iscomeForgot == "forgot" {
                                let changePwd = STORYBOARD.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC
                                changePwd?.strEmail = weakSelf.getEmail
                                weakSelf.navigationController?.pushViewController(changePwd!, animated: true)
                                return
                            }
                            weakSelf.iscomeForgot = ""
                            Utils.showMessage(type: .success, message: weakSelf.dicForgotVarification.succmsg)
                            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
                            weakSelf.navigationController?.pushViewController(objVC, animated: true)
                        }
                        else {
                            Utils.showMessage(type: .error, message: dicResponseData["errMsg"]?.stringValue ?? "")
                        }
                    } else {}

                } else {
                    Utils.hideProgressHud()
                }

            }
            }

    }
    
    func callResendApi(){
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.resendOTPEndpoint
        let param = ["email":getEmail]
        let header:HTTPHeaders = ["Content-Type":"application/json"]

        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {

                        weakSelf.dicResend = ResendOtpModule().initWithDictionary(dictionary: dicResponseData)
                        
                        if weakSelf.dicResend.status == false {
                            
                            Utils.showMessage(type:.error, message: weakSelf.dicResend.errMsg)
                        }
                        else {
                            Utils.showMessage(type:.success, message: weakSelf.dicResend.sucMsg)
                            weakSelf.count = 50
                            weakSelf.resendTimer = Timer()
                            weakSelf.resendTimer = Timer.scheduledTimer(timeInterval: 1, target: weakSelf,selector: #selector(weakSelf.update), userInfo: nil, repeats: true)

                         }
                    } else {}

                } else {
                }

            }
            }
    }
}

