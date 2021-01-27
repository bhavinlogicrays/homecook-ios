//
//  RegisterVC.swift
//

import UIKit

class RegisterVC: UIViewController,UITextFieldDelegate {
    
    // MARK:- Variables
    
    // MARK:- UIControls
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPostCode: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CommonManager.setBorder(textField: txtName)
        CommonManager.setBorder(textField: txtPhone)
        CommonManager.setBorder(textField: txtEmail)
        CommonManager.setBorder(textField: txtCity)
        CommonManager.setBorder(textField: txtPostCode)
        CommonManager.setBorder(textField: txtAddress)
        CommonManager.setCorner(button: btnNext)
       
        txtEmail.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEmail.setRightPaddingPoints(15)
        txtEmail.setLeftPaddingPoints(15)
        
        txtCity.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtCity.setRightPaddingPoints(15)
        txtCity.setLeftPaddingPoints(15)
        
        txtName.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtName.setRightPaddingPoints(15)
        txtName.setLeftPaddingPoints(15)
        
        txtPhone.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPhone.setRightPaddingPoints(15)
        txtPhone.setLeftPaddingPoints(15)
        
        txtAddress.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtAddress.setRightPaddingPoints(15)
        txtAddress.setLeftPaddingPoints(15)
        
        txtPostCode.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPostCode.setRightPaddingPoints(15)
        txtPostCode.setLeftPaddingPoints(15)
        
    }
    
    // MARK: - UI Methods
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "RegisterVC2") as! RegisterVC2
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

