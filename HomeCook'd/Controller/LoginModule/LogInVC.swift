//
//  LogInVC.swift
//

import UIKit
import Alamofire


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

        // Do any additional setup after loading the view.
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
        
        btnRegister.setTitle(strSetTitle, for: .normal)
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
        } else {
            viewSocialMedia.isHidden = false
        }
        
//        if UserDefaults.standard.value(forKey: "email") as? String  != nil  && UserDefaults.standard.value(forKey: "email") as? String != nil {
//            txtEmail.text = UserDefaults.standard.value(forKey: "email") as? String
//            txtPassword.text = UserDefaults.standard.value(forKey: "password") as? String
//        }
//        else {
//            txtEmail.text = ""
//            txtPassword.text = ""
//        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Utils.hideProgressHud()
    }
    
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        self.view.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickForgotPassWord(_ sender: Any) {
        self.view.endEditing(true)
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "ForgotPassWordVC") as! ForgotPassWordVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    @IBAction func onClickLogIn(_ sender: Any) {
        checkValidation()
    }
    
    @IBAction func onClickRememberMe(_ sender: Any) {
        self.view.endEditing(true)
        if isRememberClick == true {
            isRememberClick = false
            imgRemember.image  = UIImage(named: "uncheck")
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
            UserDefaults.standard.set(txtEmail.text!, forKey: "email")
            UserDefaults.standard.set(txtPassword.text!, forKey: "password")
            UserDefaults.standard.synchronize()
        }
        //callApi()
}
    
    //MARK:- Api Call
    func callApi(){
        Utils.showProgressHud()
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Auth.loginEndpoint
        let param = ["email":txtEmail.text!,
                     "password":txtPassword.text!]
        let header:HTTPHeaders = ["Content-Type":"application/json"]

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
                                isLogin = true
                                weakSelf.navigationController?.pushViewController(objVC, animated: true)
                            }
                            else{
                                let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
                                isLogin = true
                                weakSelf.navigationController?.pushViewController(objVC, animated: true)
                            }
                        }
                        else {
                            Utils.showMessage(type: .error, message: "Invalid Login Details")
                        }
                    } else {}

                } else {
                }
                
            }
            }
        
        
        
    }
    

}

