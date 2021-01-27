//
//  CreateAccountVC.swift
//


import UIKit

class CreateAccountVC: UIViewController,UITextFieldDelegate {

    var strng:NSString = "By clicking ‘Create Account’ you will accept our terms and conditions"
    var mutableStrng = NSMutableAttributedString()
    
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBOutlet weak var txtDateOfBirth : UITextField!
    @IBOutlet weak var lblTrms : UILabel!
    @IBOutlet weak var btnRegister : UIButton!
    @IBOutlet weak var btnLogin : UIButton!

    var txtTemp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DELEGATE.setBorder(textField: txtName)
        DELEGATE.setBorder(textField: txtEmail)
        DELEGATE.setBorder(textField: txtPassword)
        DELEGATE.setBorder(textField: txtDateOfBirth)
        DELEGATE.setCorner(button: btnRegister)
        
        btnLogin.layer.masksToBounds = false
        btnLogin.layer.cornerRadius = 10.0
        btnLogin.layer.borderWidth = 1.0
        btnLogin.layer.borderColor = UIColor.init(red: 235.0/255.0, green: 57.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor

        txtEmail.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEmail.setLeftPaddingPoints(15)
        txtEmail.setRightPaddingPoints(15)
        
        txtName.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtName.setLeftPaddingPoints(15)
        txtName.setRightPaddingPoints(15)
        
        txtPassword.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPassword.setLeftPaddingPoints(15)
        txtPassword.setRightPaddingPoints(15)
        
        txtDateOfBirth.attributedPlaceholder = NSAttributedString(string:"DD/MM/YYYY", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtDateOfBirth.setLeftPaddingPoints(15)
        txtDateOfBirth.setRightPaddingPoints(15)
        
        mutableStrng = NSMutableAttributedString(string: strng as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Poppins", size: 13) as Any])
        mutableStrng.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hexString: "#9C9BA6"), range:NSRange(location:0, length: 48))
        mutableStrng.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range:NSRange(location:48, length:20))
        lblTrms.attributedText = mutableStrng
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
    
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRegClick(_ sender: Any){
    let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
            self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func btnLoginClick(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }

    
}
