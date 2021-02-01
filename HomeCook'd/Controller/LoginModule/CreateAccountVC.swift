//
//  CreateAccountVC.swift
//


import UIKit

class CreateAccountVC: UIViewController,UITextFieldDelegate {

    // MARK:- Variables
    var strng:NSString = "By clicking ‘Create Account’ you will accept our terms and conditions"
    var mutableStrng = NSMutableAttributedString()
    var datePicker = UIDatePicker()
    
    // MARK: - UIControls
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBOutlet weak var txtDateOfBirth : UITextField!
    @IBOutlet weak var lblTrms : UILabel!
    @IBOutlet weak var btnHideUnhidePassword: UIButton!
    @IBOutlet weak var btnRegister : UIButton!
    @IBOutlet weak var btnLogin : UIButton!

    var txtTemp: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
        
    }
    
    // MARK: - UI Methods
    func setUI() {
        
        txtName.keyboardType = UIKeyboardType.alphabet
        txtEmail.keyboardType = UIKeyboardType.emailAddress
        txtPassword.keyboardType = UIKeyboardType.default
        txtPassword.isSecureTextEntry = true
        
        CommonManager.setBorder(textField: txtName)
        CommonManager.setBorder(textField: txtEmail)
        CommonManager.setBorder(textField: txtPassword)
        CommonManager.setBorder(textField: txtDateOfBirth)
        CommonManager.setCorner(button: btnRegister)
        
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
        
        
        self.txtDateOfBirth.setInputViewDatePicker(target: self, selector: #selector(tapDone)) //1

    }
    
    //MARK:- CheckValidation
    func checkValidation()  {
        self.view.endEditing(true)
        guard let strname = txtName.text,  strname.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter name")
        return
    }
        guard let stremail = txtEmail.text,  stremail.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter email")
        return
    }
        if !CommonManager.isValidEmail(txtEmail.text!){
            Utils.showMessage(type: .error, message:"Please enter valid email")
            return
        }
        
        guard let strPass = txtPassword.text,  strPass.count > 0 else {
          Utils.showMessage(type: .error, message:"Please enter password")
        return
    }
        if txtPassword.text!.count < 6 {
            Utils.showMessage(type: .error, message:"Password contain min 6 character")
            return
        }
        
        let age = getAgeFromDOF(date: txtDateOfBirth.text ?? "")
       
        if age.0 < 17 {
            txtDateOfBirth.text = ""
            CommonManager.DisplayAlertView(titleDisply: "OOPS!", msg: "Minimum age is required for create account is 17 years")
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

    func getAgeFromDOF(date: String) -> (Int,Int,Int) {

        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        let dateOfBirth = dateFormater.date(from: date)

        let calender = Calendar.current

        let dateComponent = calender.dateComponents([.year, .month, .day], from:
        dateOfBirth!, to: Date())

        return (dateComponent.year!, dateComponent.month!, dateComponent.day!)
    }
    @objc func tapDone() {
        if let datePicker = self.txtDateOfBirth.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            dateformatter.dateFormat = "dd/MM/yyyy"
            self.txtDateOfBirth.text = dateformatter.string(from: datePicker.date)
        }
        self.txtDateOfBirth.resignFirstResponder()
       
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
