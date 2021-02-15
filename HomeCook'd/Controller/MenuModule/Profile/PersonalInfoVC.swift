//
//  PersonalInfoVC.swift
//

import UIKit
import  Alamofire
import SDWebImage
import SwiftyJSON

class PersonalInfoVC: UIViewController,UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate,ImagePickerDelegate {

    // MARK: - Variables
    
    // MARK: - UI Controls
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtSetServiceTime: UITextField!
    @IBOutlet weak var lblSetServiceTime: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnEditImg: UIButton!
    @IBOutlet weak var imgSetService: UIImageView!
    @IBOutlet weak var btnProfilePic: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!

    var txtTemp: UITextField!
    var arrFrom = [String]()
    var arrTo = [String]()
    var arrAm = [String]()
    var arrPM = [String]()
    var arrData = [[String]]()
    let  SelectionPicker = UIPickerView()
    var StrSelect:String = ""
    var imagePicker: ImagePicker!
    var isImagePicked:Bool = false
    var dictEditProfile = [String:AnyObject]()
    var dictValueChange = displayDictRes
    var strHoursFrom = String()
    var strHoursTo = String()
var dictUser = LoginResponseModel()
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - UI Methods
    func setUI(){
        txtEmail.isUserInteractionEnabled = false
        imgSetService.isHidden = true
        btnEditImg.isHidden = true
        btnEdit.isSelected = false
        btnProfilePic.isUserInteractionEnabled = false
        let strgetValue  = UserDefaults.standard.value(forKey: "isCome") as? String
        if strgetValue ==  "Chef"  || strgetValue != nil{            txtSetServiceTime.isHidden = false
            lblSetServiceTime.isHidden = false
            imgSetService.isHidden = true
            btnEditImg.isHidden = true
            CommonManager.callChefProfileApi(completionHandler: {(success) in if success == true{
                self.imgProfile.sd_setImage(with: URL(string: displayDictRes.profilePic), placeholderImage: UIImage(named:"Ellipse 48"))
                self.lblUserName.text = displayDictRes.chefName
                CommonManager.txtfiedSetColor(txtvalue:displayDictRes.chefName,textfield: self.txtName)
                CommonManager.txtfiedSetColor(txtvalue:displayDictRes.chefEmail, textfield: self.txtEmail)
                CommonManager.txtfiedSetColor(txtvalue:displayDictRes.chefPhone,textfield: self.txtPhone)
                CommonManager.txtfiedSetColor(txtvalue:"Mon-Sun ,\(displayDictRes.chefHoursfrom)AM -\(displayDictRes.chefHoursto)PM",textfield: self.txtSetServiceTime)
                self.strHoursTo = displayDictRes.chefHoursto
                self.strHoursFrom = displayDictRes.chefHoursfrom
            }
              
            else {
                Utils.showMessage(type: .error, message: "Something went wrong!")
            }
            })
             arrAm = ["AM"]
            arrPM = ["PM"]
            arrTo = ["13.00","14.00","15.00","16.00","17.00","18.00","19.00","20.00","21.00","22.00","23.00","24.00"]
            arrFrom = ["1.00","2.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00"]
            arrData = [arrFrom,arrAm,arrTo,arrPM]
            createPickerView()
            self.imagePicker = ImagePicker(presentationController: self, delegate: self)


        } else {
            txtSetServiceTime.isHidden = true
            lblSetServiceTime.isHidden = true
            imgSetService.isHidden = true
            btnEditImg.isHidden = false
            CommonManager.txtfiedSetColor(txtvalue: "yourmail@gmail.com", textfield: txtEmail)
            CommonManager.txtfiedSetColor(txtvalue: "Michel Smith", textfield: txtName)
            CommonManager.txtfiedSetColor(txtvalue: "+1 2221 12 4444", textfield: txtPhone)
            CommonManager.txtfiedSetColor(txtvalue: "Sun-Mon, 10:00 AM- 11:00 PM", textfield: txtSetServiceTime)
        }
        CommonManager.setBorder(textField: txtName)
        CommonManager.setBorder(textField: txtEmail)
        CommonManager.setBorder(textField: txtPhone)
        CommonManager.setBorder(textField: txtSetServiceTime)
        
        imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
        imgProfile.layer.borderWidth = 1
        imgProfile.layer.borderColor = UIColor.clear.cgColor
    }
    
    func createPickerView() {
        SelectionPicker.delegate = self
        txtSetServiceTime.inputView = SelectionPicker
    }

    func createToolbar()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor.black
        toolbar.backgroundColor = UIColor.clear
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.closePickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        txtSetServiceTime.inputAccessoryView = toolbar
    }

    @objc func closePickerView()
    {
        view.endEditing(true)
        txtSetServiceTime.text =  "Mon-Sun ,\(strHoursFrom)AM -\(strHoursTo) PM"
    }
    // MARK: -Pickerview
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return arrData.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return arrData[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
            return arrData[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            StrSelect = "Sun-Mon, \(arrData[0][row])AM - \(arrData[2][row])PM"
            txtSetServiceTime.text =  "Sun-Mon, \(arrData[0][row])AM - \(arrData[2][row])PM"
            strHoursFrom = arrData[0][row]
           strHoursTo = arrData[2][row]
    }

    func didSelect(image: UIImage?) {
        if image == nil {
            isImagePicked = false
            if displayDictRes.profilePic == "" {
                imgProfile.image = UIImage(named: "Ellipse 48")
                dictEditProfile["profile_pic"] = "" as AnyObject
            }
            else {
                imgProfile.sd_setImage(with: URL(string: displayDictRes.profilePic), placeholderImage: UIImage(named: "Ellipse 48"))
                dictEditProfile["profile_pic"] = imgProfile.image as AnyObject
            }
        }
        
        else {
            isImagePicked = true
            imgProfile.image = image
            dictEditProfile["profile_pic"] =  imgProfile.image!
        }
        imgProfile.layer.cornerRadius = self.imgProfile.frame.size.height / 2
        imgProfile.layer.borderWidth = 1
        imgProfile.layer.borderColor = UIColor.clear.cgColor
    }
    

    //MARK:- Action
    
    @IBAction func onClickBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickEdit(_ sender: UIButton) {
        
        if btnEdit.isSelected {
            let strgetValue  = UserDefaults.standard.value(forKey: "isCome") as? String
            if strgetValue ==  "Chef"  || strgetValue != nil{
                btnEditImg.isHidden = true
                imgSetService.isHidden = true

            }
            else {
                btnEditImg.isHidden = false
                imgSetService.isHidden = true
            }
            btnProfilePic.isUserInteractionEnabled = false
            btnEdit.isSelected = false
            txtEmail.isUserInteractionEnabled = false
            txtName.isUserInteractionEnabled = false
            txtPhone.isUserInteractionEnabled = false
            txtSetServiceTime.isUserInteractionEnabled = false
            checkValidation()
            txtName.backgroundColor = UIColor.init(hexString: "#F6F6F6")
            txtEmail.backgroundColor = UIColor.init(hexString: "#F6F6F6")
            txtPhone.backgroundColor = UIColor.init(hexString: "#F6F6F6")
            txtSetServiceTime.backgroundColor = UIColor.init(hexString: "#F6F6F6")
        }
        else {
            
            btnEdit.isSelected = true
            btnProfilePic.isUserInteractionEnabled = true
            let strgetValue  = UserDefaults.standard.value(forKey: "isCome") as? String
            txtName.isUserInteractionEnabled = true
            txtPhone.isUserInteractionEnabled = true
            txtSetServiceTime.isUserInteractionEnabled = true
            btnEditImg.isHidden = true
            txtName.backgroundColor = UIColor.init(hexString: "#FFFFFF")
            txtPhone.backgroundColor = UIColor.init(hexString: "#FFFFFF")
            txtSetServiceTime.backgroundColor = UIColor.init(hexString: "#FFFFFF")
            CommonManager.setBorder(textField: txtName)
            CommonManager.setBorder(textField: txtEmail)
            CommonManager.setBorder(textField: txtPhone)
            CommonManager.setBorder(textField: txtSetServiceTime)
            if strgetValue ==  "Chef"  || strgetValue != nil{
                imgSetService.isHidden = false
                
            } else {
                imgSetService.isHidden = true
            }

        }
        
    }
    @IBAction func btnProfileCameraClick(_ sender: Any) {
        self.imagePicker.present(from: btnProfilePic)
    }

    // MARK: - Delegate Methods
    // MARK: UITextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        createPickerView()
        createToolbar()
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
    
    //MARK:- Check Validation
    func checkValidation() {
        
        guard let strName  = txtName.text , strName.count > 0 else {
            Utils.showMessage(type: .error, message: "Please enter name")
            return
        }
        guard let strPhone  = txtPhone.text , strPhone.count > 0 else {
            Utils.showMessage(type: .error, message: "Please enter phone number")
            return
        }
        if txtPhone.text!.count > 10 || txtPhone.text!.count < 10 {
            Utils.showMessage(type: .error, message: "Please enter valid phone number")
            return
        }
        dictEditProfile["name"] = txtName.text! as AnyObject
        dictEditProfile["phone"] = txtPhone.text! as AnyObject
        dictEditProfile["hours_from"] = strHoursFrom as AnyObject
        dictEditProfile["hours_to"] = strHoursTo as AnyObject

        
        if !(dictEditProfile["name"] as! String == displayDictRes.chefName) || !(dictEditProfile["phone"] as! String == displayDictRes.chefPhone) || !(dictEditProfile["hours_from"]as! String == displayDictRes.chefHoursfrom) ||  !(dictEditProfile["hours_to"]as! String == displayDictRes.chefHoursto) || dictEditProfile["profile_pic"] as? UIImage  != nil  {
        
            dictEditProfile["email"] = displayDictRes.chefEmail as AnyObject
            callEditProfile()
        }
        
    }
    

    //MARK:- Api Call
    func callEditProfile(){
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        let header:HTTPHeaders = ["Content-Type":"multipart/form-data"]
        let apiUrl = ApiList.URL.Host  + ApiList.URL.ChefProfile.editProfile
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        dictEditProfile["api_token"] = strToken as AnyObject?
        Utils.showProgressHud()
        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in self.dictEditProfile {
                if let temp = value as? String {
                    multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }

            }
            if self.isImagePicked == true {
                let profileimagetoDataConvert = (self.dictEditProfile["profile_pic"] as! UIImage).pngData()
                multipartFormData.append(profileimagetoDataConvert!, withName: "profile_pic", fileName: "\(Date.init().timeIntervalSince1970).png", mimeType: "image/png")
            }
        },
        to: apiUrl, method: .post , headers: header).uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
            
        })
            .responseJSON(completionHandler: { (response) in
                Utils.hideProgressHud()
                if let err = response.error{
                    print(err)
                    Utils.showMessage(type: .error, message: "Something went wrong!")
                    return
                }
                let json = response.data
                if (json != nil)
                {
                    let jsonObject = JSON(json!)
                    guard jsonObject.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonObject.dictionary {
                        if dicResponseData["status"]?.boolValue == true
                        {
                        CommonManager.callChefProfileApi(completionHandler: {(success) in
                            if success == true
                            {
                                Utils.showMessage(type: .success, message: "Profile updated successfully!")
                                self.lblUserName.text = self.txtName.text

                            }
                            else {
                                Utils.showMessage(type: .error, message: "Something went wrong!")
                            }
                        })
                    }
                    }
                }
            })
            }
//        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:dictEditProfile, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
//            if let weakSelf = self {
//                if  let jsonResponse = dicResponseWithSuccess {
//                    guard jsonResponse.dictionary != nil else {
//                        return
//                    }
//                    if let dicResponseData = jsonResponse.dictionary {
//                        if dicResponseData["status"]?.boolValue ==  true
//                        {
//                            CommonManager.callChefProfileApi(completionHandler: {(success) in
//                                if success == true
//                                {
//                                    Utils.showMessage(type: .success, message: "Profile updated successfully!")
//
//                                }
//                                else {
//                                    Utils.showMessage(type: .error, message: "Something went wrong!")
//
//                                }
//                            })
//                        }
//                        else {
//                            Utils.showMessage(type: .error, message: "Something went wrong!")
//
//                        }
//                    } else {
//                        Utils.showMessage(type: .error, message: "Something went wrong!")
//                    }
//
//                } else {
//                }
//
//            }
//            }

}
