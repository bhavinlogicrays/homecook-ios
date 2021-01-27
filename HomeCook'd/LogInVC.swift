//
//  LogInVC.swift
//

import UIKit

class LogInVC: UIViewController,UITextFieldDelegate {
    
    // MARK: - Variables
    var strSetTitle:String = ""

    // MARK: - UIControls
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewSocialMedia: UIView!

    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DELEGATE.setBorder(textField: txtEmail )
        DELEGATE.setBorder(textField: txtPassword )
        DELEGATE.setCorner(button: btnLogin)
        
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
        
        if DELEGATE.strIsComefrom ==  "Chef"  {
            viewSocialMedia.isHidden = true
        } else {
            viewSocialMedia.isHidden = false
            

        }
    }
   
    // MARK: - UI Methods
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickForgotPassWord(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "ForgotPassWordVC") as! ForgotPassWordVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    @IBAction func onClickLogIn(_ sender: Any) {
        if DELEGATE.strIsComefrom ==  "Chef" {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TabVC") as! TabVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else{
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
            self.navigationController?.pushViewController(objVC, animated: true)

        }
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
        if DELEGATE.strIsComefrom ==  "Chef"  {
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtTemp.text = txtTemp.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        txtTemp.resignFirstResponder()
        txtTemp = nil
    } 
}

