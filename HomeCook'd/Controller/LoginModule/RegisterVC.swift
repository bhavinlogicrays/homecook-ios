//
//  RegisterVC.swift
//

import UIKit

class RegisterVC: UIViewController,UITextFieldDelegate,ImagePickerDelegate {
    
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
    @IBOutlet weak var btnProfileCamera: UIButton!

    var txtTemp: UITextField!
    var imagePicker: ImagePicker!
    var isImagePicked:Bool = false
    

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

        // Do any additional setup after loading the view.
        SetUI()
       
    }
    
    // MARK: - UI Methods
    func SetUI() {
        
        CommonManager.setBorder(textField: txtName)
        CommonManager.setBorder(textField: txtPhone)
        CommonManager.setBorder(textField: txtEmail)
        CommonManager.setBorder(textField: txtCity)
        CommonManager.setBorder(textField: txtPostCode)
        CommonManager.setBorder(textField: txtAddress)
        CommonManager.setCorner(button: btnNext)
        
        
        txtAddress.keyboardType = .default
        txtName.keyboardType = .alphabet
        txtCity.keyboardType = .alphabet
        txtPhone.keyboardType = .numberPad
        txtPostCode.keyboardType = .numberPad
        txtEmail.keyboardType = .emailAddress

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
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        self.view.endEditing(true)
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        checkValidation()
    }
    
    @IBAction func btnProfileCameraClick(_ sender: Any) {
        self.imagePicker.present(from: btnProfileCamera)
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
        return true
    }
    
    func didSelect(image: UIImage?) {
        if image == nil {
            isImagePicked = false
            ProfileImage.image = UIImage(named: "")
        }
        
        else {
            isImagePicked = true
        }
        ProfileImage.layer.cornerRadius = self.ProfileImage.frame.size.height / 2
        ProfileImage.layer.borderWidth = 1
        ProfileImage.layer.borderColor = UIColor.clear.cgColor
        ProfileImage.image = image
    }
    

    //MARK:- Check Validation
    func checkValidation() {
        self.view.endEditing(true)
        guard let strname = txtName.text,  strname.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter name")
        return
    }
        guard let strphone = txtPhone.text,  strphone.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter phone number")
        return
    }
        
//     if !CommonManager.validatePhone(Phone: txtPhone.text!){
//            Utils.showMessage(type: .error, message:"Phone number should be start with +")
//            return
//        }
        if txtPhone.text!.count > 10 ||  txtPhone.text!.count < 10 {
                        Utils.showMessage(type: .error, message:"Phone number should be 10 digit")
        return
    }
        guard let stremail = txtEmail.text,  stremail.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter email")
        return
    }
        
        if !CommonManager.isValidEmail(txtEmail.text!) {
            Utils.showMessage(type: .error, message:"Please enter valid email")
            return
        }
        
        guard let strcity = txtCity.text,  strcity.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter city")
        return
    }
        
        guard let strpostcode  = txtPostCode.text,  strpostcode.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter postcode")
        return
    }
        if txtPostCode.text!.count > 6 ||  txtPostCode.text!.count < 6{
            Utils.showMessage(type: .error, message:"Please enter valid post code")
            return
        }
        guard let straddress  = txtAddress.text,  straddress.count > 0 else {
            Utils.showMessage(type: .error, message:"Please enter address")
        return
    }
        dictData["name"]     = txtName.text!
        dictData["phone"]    = txtPhone.text!
        dictData["email"]    = txtEmail.text!
        dictData["city"]     = txtCity.text!
        dictData["postcode"]  = txtPostCode.text!
        dictData["address"]  = txtAddress.text!
        if isImagePicked == true {
            dictData["image"]    = ProfileImage.image
        }
        else {
            dictData["image"]    =  nil
        }
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "RegisterVC2") as! RegisterVC2
        self.navigationController?.pushViewController(objVC, animated: true)

        
    }
    
    
}

