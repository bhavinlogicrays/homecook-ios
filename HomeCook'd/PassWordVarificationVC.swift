//
//  PassWordVarificationVC.swift
//


import UIKit

class PassWordVarificationVC: UIViewController,UITextFieldDelegate {

    // MARK:- Variables
    var myString:NSString = "We have sent a code to your email example@gmail.com"
    var myMutableString = NSMutableAttributedString()
    
    // MARK:- UIControls
    @IBOutlet weak var lblVerification: UILabel!
    @IBOutlet weak var txtCode1: UITextField!
    @IBOutlet weak var txtCode2: UITextField!
    @IBOutlet weak var txtCode3: UITextField!
    @IBOutlet weak var txtCode4: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtCode1.becomeFirstResponder()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Poppins", size: 16.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range: NSRange(location: 34,length:17))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 0,length:34))
        lblVerification.attributedText = myMutableString
        
        DELEGATE.setBorder(textField: txtCode1)
        DELEGATE.setBorder(textField: txtCode2)
        DELEGATE.setBorder(textField: txtCode3)
        DELEGATE.setBorder(textField: txtCode4)
        DELEGATE.setCorner(button: btnVerify)
    }
    
    // MARK: - UI Methods
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickVerify(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TabVC") as! TabVC
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if txtTemp.text!.count < 1  && string.count > 0{
               let nextTag = txtTemp.tag + 1

               // get next responder
               var nextResponder = txtTemp.superview?.viewWithTag(nextTag)

               if (nextResponder == nil){

//                   nextResponder = txtTemp.superview?.viewWithTag(0)
                nextResponder?.endEditing(true)
               }
               txtTemp.text = string
               nextResponder?.becomeFirstResponder()
               return false
           }
           else if txtTemp.text!.count >= 1  && string.count == 0{
               // on deleting value from Textfield
               let previousTag = txtTemp.tag - 1

               // get next responder
               var previousResponder = txtTemp.superview?.viewWithTag(previousTag)

               if (previousResponder == nil){
                   previousResponder = txtTemp.superview?.viewWithTag(1)
               }
                txtTemp.text = ""
               previousResponder?.becomeFirstResponder()
               return false
           }
           return true
    }

}

