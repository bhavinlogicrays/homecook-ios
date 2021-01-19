//
//  AddNewCardVC.swift
//

import UIKit

class AddNewCardVC: UIViewController {

    // MARK: - Variables
    // MARK: - UI Controls
    @IBOutlet weak var txtCardName: UITextField!
    @IBOutlet weak var txtCardNum: UITextField!
    @IBOutlet weak var txtExpDate: UITextField!
    @IBOutlet weak var txtCVC: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DELEGATE.setBorder(textField: txtCardName )
        DELEGATE.setBorder(textField: txtCardNum )
        DELEGATE.setBorder(textField: txtExpDate )
        DELEGATE.setBorder(textField: txtCVC )
        
        btnConfirm.layer.masksToBounds = false
        btnConfirm.layer.cornerRadius = 10.0
        btnConfirm.layer.borderWidth = 1.0
        btnConfirm.layer.borderColor = UIColor.init(red: 235.0/255.0, green: 57.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor
        
        txtCardName.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtCardName.setLeftPaddingPoints(15)
        txtCardName.setRightPaddingPoints(15)
        
        txtCardNum.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtCardNum.setLeftPaddingPoints(15)
        txtCardNum.setRightPaddingPoints(15)
        
        txtExpDate.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtExpDate.setLeftPaddingPoints(15)
        txtExpDate.setRightPaddingPoints(15)
        
        txtCVC.attributedPlaceholder = NSAttributedString(string:"Type Here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtCVC.setLeftPaddingPoints(15)
        txtCVC.setRightPaddingPoints(15)
        
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
