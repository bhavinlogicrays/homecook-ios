//
//  AddNewCardVC.swift
//

import UIKit

class AddNewCardVC: UIViewController,UITextFieldDelegate {

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
        
        CommonManager.setBorder(textField: txtCardName )
        CommonManager.setBorder(textField: txtCardNum )
        CommonManager.setBorder(textField: txtExpDate )
        CommonManager.setBorder(textField: txtCVC )
        CommonManager.setCorner(button: btnConfirm)
        
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
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickConfirm(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PaymentSuccessVC") as! PaymentSuccessVC
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
