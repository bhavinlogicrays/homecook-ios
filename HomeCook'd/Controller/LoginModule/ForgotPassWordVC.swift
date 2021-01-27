//
//  ForgotPassWordVC.swift
//

import UIKit

class ForgotPassWordVC: UIViewController,UITextFieldDelegate {

    // MARK:- Variables
    
    // MARK:- UIControls
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSendCode: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CommonManager.setBorder(textField: txtEmail)
        CommonManager.setCorner(button: btnSendCode)
    
        txtEmail.attributedPlaceholder = NSAttributedString(string:"example@gmail.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEmail.setRightPaddingPoints(15)
        txtEmail.setLeftPaddingPoints(15)
        
        txtEmail.keyboardType = .emailAddress
        txtEmail.becomeFirstResponder()
    }
    
    // MARK: - UI Methods
    
    // MARK: - IBAction Methods
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickSendCode(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PassWordVarificationVC") as! PassWordVarificationVC
        self.navigationController?.pushViewController(objVC, animated: true)
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
