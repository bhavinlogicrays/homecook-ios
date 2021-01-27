//
//  AddressVC2.swift
//

import UIKit

class AddressVC2: UIViewController,UITextFieldDelegate {

    // MARK: - Variables
    
    // MARK: - UIControls
    @IBOutlet weak var imgMap: UIImageView!
    @IBOutlet weak var viewAdrs: UIView!
    @IBOutlet weak var txtAdrs: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtApprt: UITextField!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnWork: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var btnSaveLocation: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgMap.layer.cornerRadius = 10.0
        
        viewAdrs.layer.cornerRadius = 10.0
        viewAdrs.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1).cgColor
        viewAdrs.layer.borderWidth = 1.0
        
        DELEGATE.setBorder(textField: txtStreet )
        DELEGATE.setBorder(textField: txtCode )
        DELEGATE.setBorder(textField: txtApprt )
        DELEGATE.setCorner(button: btnSaveLocation)
        
        btnHome.layer.cornerRadius = btnHome.frame.size.height/2
        btnWork.layer.cornerRadius = btnWork.frame.size.height/2
        btnOther.layer.cornerRadius = btnOther.frame.size.height/2
        
        txtStreet.attributedPlaceholder = NSAttributedString(string:"Hason Nagar", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtStreet.setLeftPaddingPoints(15)
        txtStreet.setRightPaddingPoints(15)
        
        txtAdrs.attributedPlaceholder = NSAttributedString(string:"3235 Royal Ln. mesa, new jersy 34567", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtAdrs.setLeftPaddingPoints(15)
        txtAdrs.setRightPaddingPoints(15)
        
        txtCode.attributedPlaceholder = NSAttributedString(string:"34567689", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtCode.setLeftPaddingPoints(15)
        txtCode.setRightPaddingPoints(15)
        
        txtApprt.attributedPlaceholder = NSAttributedString(string:"345", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtApprt.setLeftPaddingPoints(15)
        txtApprt.setRightPaddingPoints(15)
        
    }
    

    @IBAction func btnSaveLocationClick(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
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
