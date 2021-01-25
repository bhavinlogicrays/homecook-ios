//
//  PersonalInfoVC.swift
//

import UIKit

class PersonalInfoVC: UIViewController,UITextFieldDelegate {

    // MARK: - Variables
    // MARK: - UI Controls
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtSetServiceTime: UITextField!
    @IBOutlet weak var lblSetServiceTime: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnEditImg: UIButton!

    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        btnEdit.isSelected = false
        if DELEGATE.strIsComefrom == "Chef" {
            txtSetServiceTime.isHidden = false
            lblSetServiceTime.isHidden = false
            btnEditImg.isHidden = true

        } else {
            txtSetServiceTime.isHidden = true
            lblSetServiceTime.isHidden = true
            btnEditImg.isHidden = false

        }
        // Do any additional setup after loading the view.
        
        setBorder(textField: txtName)
        setBorder(textField: txtEmail)
        setBorder(textField: txtPhone)
        setBorder(textField: txtSetServiceTime)
        
        txtEmail.attributedPlaceholder = NSAttributedString(string:"yourmail@gmail.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEmail.setLeftPaddingPoints(15)
        txtEmail.setRightPaddingPoints(15)
    
        txtName.attributedPlaceholder = NSAttributedString(string:"Michel Smith", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtName.setLeftPaddingPoints(15)
        txtName.setRightPaddingPoints(15)
        
        txtPhone.attributedPlaceholder = NSAttributedString(string:"+1 2221 12 4444", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPhone.setLeftPaddingPoints(15)
        txtPhone.setRightPaddingPoints(15)
        
        txtSetServiceTime.attributedPlaceholder = NSAttributedString(string:"sun-mon, 10:00 AM- 11:00 pM", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtSetServiceTime.setLeftPaddingPoints(15)
        txtSetServiceTime.setRightPaddingPoints(15)
        
    }
    
    func setBorder(textField: UITextField) {
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 10.0
       
    }

    @IBAction func onClickBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickEdit(_ sender: UIButton) {
//        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PersonalEditVC") as! PersonalEditVC
//        self.navigationController?.pushViewController(objVC, animated: true)
        if btnEdit.isSelected {
            btnEdit.isSelected = false
            

        } else {
            btnEdit.isSelected = true
            
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
