//
//  PassWordVarificationVC.swift
//


import UIKit
import Alamofire

class PassWordVarificationVC: UIViewController,UITextFieldDelegate {

    // MARK:- Variables
    var myString:NSString = "We have sent a code to your email example@gmail.com"
    var myMutableString = NSMutableAttributedString()
    
    // MARK:- UIControls
    @IBOutlet weak var lblVerification: UILabel!
    @IBOutlet weak var txtCode1: UITextField!
    @IBOutlet weak var txtCode2: UITextField!
    @IBOutlet weak var txtCode3: UITextField!
    @IBOutlet weak var txtCode4: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var btnResend: UIButton!
    
    var txtTemp: UITextField!
    lazy var dicForgotVarification = Forgot_VarificationCodeResponseModel()
    lazy var dicResend = ResendOTPResponseModel()
    var getEmail =  String()
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
    }
    
    // MARK: - UI Methods
    func setUI() {
        txtCode1.keyboardType = UIKeyboardType.numbersAndPunctuation
        txtCode2.keyboardType = UIKeyboardType.numbersAndPunctuation
        txtCode3.keyboardType = UIKeyboardType.numbersAndPunctuation
        txtCode4.keyboardType = UIKeyboardType.numbersAndPunctuation
        
        txtCode1.becomeFirstResponder()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Poppins", size: 16.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range: NSRange(location: 34,length:17))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 0,length:34))
        lblVerification.attributedText = myMutableString
        
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
        
        callApi()
    }
    
    @IBAction func onClickResend(_ sender: Any) {
        callResendApi()
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
    func callApi(){
        Utils.showProgressHud()
       
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.forgot_VarificationEndpoint
        let param = ["email":getEmail,
                     "verification_code":txtCode1.text! + txtCode2.text! + txtCode3.text! + txtCode4.text!]
        let header:HTTPHeaders = ["Content-Type":"application/json"]

        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {

                        weakSelf.dicForgotVarification = Forgot_VarificationCodeResponseModel().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dicForgotVarification.status == true {

                            Utils.showMessage(type:.success, message: weakSelf.dicForgotVarification.succmsg)
                            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TabVC") as! TabVC
                            weakSelf.navigationController?.pushViewController(objVC, animated: true)
                        }
                        else {
                            Utils.showMessage(type: .error, message: "Something went wrong!")
                        }
                    } else {}

                } else {
                }

            }
            }

    }
    
    func callResendApi(){
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

                        weakSelf.dicResend = ResendOTPResponseModel().initWithDictionary(dictionary: dicResponseData)
                        
                        if weakSelf.dicResend.status == false {
                            
                            Utils.showMessage(type:.success, message: weakSelf.dicResend.errormsg)

                        }
                        else {
                            Utils.showMessage(type: .error, message: "Something went wrong!")
                        }
                    } else {}

                } else {
                }

            }
            }
    }
}

