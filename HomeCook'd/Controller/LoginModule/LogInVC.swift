//
//  LogInVC.swift
//

import UIKit
import Alamofire
import SDWebImage

class LogInVC: UIViewController,UITextFieldDelegate {
    
    
    // MARK: - Variables
    var strSetTitle:String = ""
    
    // MARK: - UIControls
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewSocialMedia: UIView!
    @IBOutlet weak var btnHideUnhidePassword: UIButton!
    @IBOutlet weak var btnRememberme: UIButton!
    @IBOutlet weak var imgRemember: UIImageView!
    
    var txtTemp: UITextField!
    var isRememberClick:Bool = false
    var isHideUnhidePwd:Bool = false
    
    lazy var dicLogin = LoginResponseModel()
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
    }
    
    // MARK: - UI Methods
    
    func setUI() {
        txtEmail.keyboardType = UIKeyboardType.emailAddress
        txtPassword.keyboardType = UIKeyboardType.default
        txtPassword.isSecureTextEntry = true
        
        CommonManager.setBorder(textField: txtEmail )
        CommonManager.setBorder(textField: txtPassword )
        CommonManager.setCorner(button: btnLogin)
        
        //        btnRegister.setTitle(strSetTitle, for: .normal)
        btnRegister.layer.masksToBounds = false
        btnRegister.layer.cornerRadius = 10.0
        btnRegister.layer.borderWidth = 1.0
        btnRegister.layer.borderColor = UIColor.init(red: 235.0/255.0, green: 57.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor
        
        txtEmail.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEmail.setLeftPaddingPoints(15)
        txtEmail.setRightPaddingPoints(15)
        
        txtPassword.attributedPlaceholder = NSAttributedString(string:"********", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPassword.setLeftPaddingPoints(15)
        txtPassword.setRightPaddingPoints(15)
        
        if strIsComefrom ==  "Chef"  {
            viewSocialMedia.isHidden = true
            btnRegister.setTitle("Register", for: .normal)
            
            let retrievedString: String? = KeychainWrapper.standard.string(forKey: "email")
            let retrievedString1: String? = KeychainWrapper.standard.string(forKey: "password")

            if (retrievedString != "" && retrievedString1 != "") && (retrievedString != nil && retrievedString1 != nil)  {
                self.txtEmail.text = retrievedString
                self.txtPassword.text = retrievedString1
                isRememberClick = true
                imgRemember.image  = UIImage(named: "CheckMark")

            }
            else {
                self.txtEmail.text = ""
                self.txtPassword.text = ""
                isRememberClick = false
                imgRemember.image  = UIImage(named: "uncheck")

            }

        } else {
            viewSocialMedia.isHidden = false
            btnRegister.setTitle("Create Account", for: .normal)
        }



    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        self.view.endEditing(true)
        let dashboardVC = navigationController!.viewControllers.filter { $0 is WelComeVC }.first!
        navigationController!.popToViewController(dashboardVC, animated: true)
    }
    
    @IBAction func onClickForgotPassWord(_ sender: Any) {
        self.view.endEditing(true)
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "ForgotPassWordVC") as! ForgotPassWordVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickLogIn(_ sender: Any) {
        self.view.endEditing(true)
        if strIsComefrom == "Chef" {
            checkValidation()
            
        }
        else {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
    }
    
    @IBAction func onClickRememberMe(_ sender: Any) {
        self.view.endEditing(true)
        if isRememberClick == true {
            isRememberClick = false
            imgRemember.image  = UIImage(named: "uncheck")
            let removeSuc = KeychainWrapper.standard.removeObject(forKey: "email")
            let removeSuc1 = KeychainWrapper.standard.removeObject(forKey: "password")
        }
        else {
            isRememberClick = true
            imgRemember.image  = UIImage(named: "CheckMark")
            
        }
    }
    
    @IBAction func onClickHideUnhidePassword(_ sender: Any) {
        self.view.endEditing(true)
        if btnHideUnhidePassword.isSelected {
            btnHideUnhidePassword.isSelected = false
            txtPassword.isSecureTextEntry = true
        }
        else {
            btnHideUnhidePassword.isSelected = true
            txtPassword.isSecureTextEntry = false
        }
    }
    
    
    @IBAction func onClickRegister(_ sender: Any) {
        self.view.endEditing(true)
        if strIsComefrom ==  "Chef"  {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "CreateAccountVC") as! CreateAccountVC
            self.navigationController?.pushViewController(objVC, animated: true)
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
    
    
    //MARK:- CheckValidation
    func checkValidation() {
        self.view.endEditing(true)
        guard let stremail = txtEmail.text,  stremail.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter email")
            return
        }
        guard let strpwd = txtPassword.text,  strpwd.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter password")
            return
        }
        
        if isRememberClick == true {
//            guard let userName = self.txtEmail.text,
//                  let password = self.txtPassword.text else { return }
                
            let strEmail: String = self.txtEmail.text!
            let strPass: String = self.txtPassword.text!
            let saveSuccessful: Bool = KeychainWrapper.standard.set(strEmail, forKey: "email")
            let saveSuccessful1: Bool = KeychainWrapper.standard.set(strPass, forKey: "password")

            print(saveSuccessful)
            print(saveSuccessful1)

            

//            let keychain = KeychainSwift()
//            keychain.accessGroup = "$(AppIdentifierPrefix)com.homecook.application"
//            keychain.set(userName, forKey: "userName")
//            keychain.set(password, forKey: "password")
        }
        callApi()
    }
    
    //MARK:- Api Call
    func callApi(){
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.loginEndpoint
        let param = ["email":txtEmail.text!,
                     "password":txtPassword.text!]
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
                        
                        weakSelf.dicLogin = LoginResponseModel().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dicLogin.status == true {
                            if strIsComefrom ==  "Chef" {
                                    let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TabVC") as! TabVC
                                    UserDefaults.standard.setValue(weakSelf.dicLogin.token, forKey: "app_token")
                                    DELEGATE.isLogin = true
                                    UserDefaults.standard.setValue("true", forKey: "isLogin")
                                    weakSelf.navigationController?.pushViewController(objVC, animated: true)
                                
                            }
                            else{
                                let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
                                DELEGATE.isLogin = true
                                weakSelf.navigationController?.pushViewController(objVC, animated: true)
                            }
                            UserDefaults.standard.setValue(strIsComefrom, forKey: "isCome")
                            UserDefaults.standard.synchronize()
                        }
                        else {
                            if weakSelf.dicLogin.userStatus == "0" {
                                Utils.showMessage(type: .error, message: dicResponseData["errMsg"]?.string ?? "Your email is not verified. Please verify your email first")

                                let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PassWordVarificationVC") as! PassWordVarificationVC
                                objVC.getEmail = weakSelf.txtEmail.text!
                                weakSelf.txtEmail.text = ""
                                weakSelf.txtPassword.text = ""
                                weakSelf.navigationController?.pushViewController(objVC, animated: true)
                            }
                            
                            else if weakSelf.dicLogin.userStatus == "2" {
                                Utils.showMessage(type: .error, message: dicResponseData["errMsg"]?.string ?? "Your certificate is not approved by admin")
                                return
                            }
                            else {
                                Utils.showMessage(type: .error, message: dicResponseData["errMsg"]?.string ?? "")
                            }
                        }
                    } else {
                        Utils.showMessage(type: .error, message: "Something went wrong!")
                    }
                    
                } else {
                }
                
            }
        }
        
        
        
    }
    
    
}

