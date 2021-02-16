import UIKit
import Alamofire
import SwiftyJSON

class RegisterVC2: UIViewController,UITextFieldDelegate,ImagePickerDelegate,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    // MARK:- Variables
    
    // MARK:- UIControls
    @IBOutlet weak var lblCertificate: UILabel!
    @IBOutlet weak var imgCerti: UIImageView!
    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var txtCooking: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnUploadCertificate: UIButton!
    @IBOutlet weak var btnHideUnhidePwd: UIButton!
    @IBOutlet weak var btnPickup: UIButton!
    @IBOutlet weak var btnDelivery: UIButton!
    @IBOutlet weak var imgDelivery: UIImageView!
    @IBOutlet weak var imgPickup: UIImageView!

    
    var txtTemp: UITextField!
    var arrSelectPassion = [String]()
    var arrFrom = [String]()
    var arrTo = [String]()
    var arrAm = [String]()
    var arrPM = [String]()
    var dictRegResponse  = RegisterModule()
    var arrData = [[String]]()
    var  imagePicker: ImagePicker!
    let  SelectionPicker = UIPickerView()
    var activeTextField = Int()
    var strImageSel = String()
    let radioController: RadioButtonManage = RadioButtonManage()
    var isImagePicked:Bool = false

    var StrSelect:String = ""
    var strSelectCom:String = ""


    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        activeTextField = 0
        arrSelectPassion = ["Yes","No"]
        arrAm = ["AM"]
        arrPM = ["PM"]
        arrTo = ["13.00","14.00","15.00","16.00","17.00","18.00","19.00","20.00","21.00","22.00","23.00","24.00"]
        arrFrom = ["1.00","2.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00"]
        btnHideUnhidePwd.isSelected = false
        txtPassword.isSecureTextEntry  = true
        arrData = [arrFrom,arrAm,arrTo,arrPM]
        radioController.buttonsArray = [btnPickup,btnDelivery]
        radioController.defaultButton = btnPickup
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

}

    // MARK: -UI Methods
    
    func createPickerView() {
        SelectionPicker.delegate = self
        txtCooking.inputView = SelectionPicker
        txtTime.inputView = SelectionPicker
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
        txtCooking.inputAccessoryView = toolbar
        txtTime.inputAccessoryView = toolbar
    }


        func setUI() {
            CommonManager.setCorner(button: btnRegister)
            CommonManager.setBorder(textField: txtCooking)
            CommonManager.setBorder(textField: txtTime)
            CommonManager.setBorder(textField: txtPassword)
            

            setDashPattern(view: viewPhoto)
            txtPassword.attributedPlaceholder = NSAttributedString(string:"********", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
            txtPassword.setRightPaddingPoints(15)
            txtPassword.setLeftPaddingPoints(15)
            
            txtTime.attributedPlaceholder = NSAttributedString(string:"Select Service Time", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
            txtTime.setLeftPaddingPoints(15)
            
            txtCooking.attributedPlaceholder = NSAttributedString(string:"Select", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
            txtCooking.setRightPaddingPoints(15)
            txtCooking.setLeftPaddingPoints(15)
            let imageView = UIImageView()
            let image = UIImage(named: "Arrow")
            let imageContainerView1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 45))
            imageView.frame = CGRect(x: imageContainerView1.center.x - 10, y: 10, width: 20, height: 20)
            imageView.image = image
            imageContainerView1.addSubview(imageView)
            txtCooking.rightView = imageContainerView1
            txtCooking.rightView?.isUserInteractionEnabled = false
            txtCooking.rightViewMode = .always

            let imageView1 = UIImageView()
            let image1 = UIImage(named: "cale-ic")
            let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 45))
            imageView1.frame = CGRect(x: imageContainerView.center.x - 10, y: 10, width: 20, height: 20)
            imageView1.image = image1
            imageContainerView.addSubview(imageView1)
            txtTime.rightView = imageContainerView
            txtTime.rightView?.isUserInteractionEnabled = false
            txtTime.rightViewMode = .always
        }
    
        @objc func closePickerView()
        {
            view.endEditing(true)
            if activeTextField == 0 {
                if txtCooking.text  == "" {
                    txtCooking.text = arrSelectPassion[0]
                }

            }

            else {
                if StrSelect == ""  {
                    StrSelect = "\(arrData[0][0])"
                }
                 if strSelectCom == "" {
                    strSelectCom = "\(arrData[2][0])"
                }
                txtTime.text = "Mon-Sun \(StrSelect)AM - \(strSelectCom) PM "
                dictData["hours_from"] = StrSelect
                dictData["hours_to"] = strSelectCom

            }
           
        }

    
        func setDashPattern(view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = [5.0, 5.0]
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH - 40, height: view.frame.size.height)
        shapeLayer.fillColor = nil
        shapeLayer.path = UIBezierPath(roundedRect: shapeLayer.frame, cornerRadius: 10.0).cgPath
        view.layer.addSublayer(shapeLayer)
    }
    
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        self.view.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
        self.view.endEditing(true)
            checkValidation()
    }
    
    @IBAction func btnUploadCertiClick(_ sender: Any) {
        self.view.endEditing(true)
        self.imagePicker.present(from: btnUploadCertificate)
    }

    @IBAction func btnPickupClick(_ sender: UIButton) {
        self.view.endEditing(true)
        radioController.buttonArrayUpdated(buttonSelected: sender)

    }

    @IBAction func btnDeliveryClick(_ sender: UIButton) {
        self.view.endEditing(true)
        radioController.buttonArrayUpdated(buttonSelected: sender)

    }

    @IBAction func btnHideUnhidePwdClick(_ sender: Any) {
        self.view.endEditing(true)
        if btnHideUnhidePwd.isSelected {
            btnHideUnhidePwd.isSelected = false
            txtPassword.isSecureTextEntry = true
        }
        else {
            btnHideUnhidePwd.isSelected = true
            txtPassword.isSecureTextEntry = false
        }
    }

    // MARK: - Delegate Methods
    
    // MARK: UITextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        txtTemp = textField
        createPickerView()
        createToolbar()

        if textField == txtCooking {
            activeTextField = 0
        }
        else if textField == txtTime{
            activeTextField = 1
            SelectionPicker.reloadAllComponents()
        }
    }
    
    
    // MARK: -ImagePicker

    func didSelect(image: UIImage?) {
        if image == nil
        {
            imgCerti.image  = UIImage(named: "upload-video")
            isImagePicked = false
            return
        }
        isImagePicked = true
        imgCerti.layer.cornerRadius = imgCerti.frame.size.width / 2
        imgCerti.layer.borderWidth = 1
        imgCerti.layer.borderColor = UIColor.clear.cgColor
        imgCerti.image = image
    }
    // MARK: -Pickerview
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if activeTextField == 0 {
            return 1
        }
        else {
            return arrData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if activeTextField == 0 {
            return arrSelectPassion.count
        }
        else {
            return arrData[component].count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if activeTextField == 0
        {
            return arrSelectPassion[row]
        }
        else {
            return arrData[component][row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if activeTextField == 0 {
            txtCooking.text = arrSelectPassion[row]
        }
        else {
            
            if component == 0 {
                let strSelectedRow1  = SelectionPicker.selectedRow(inComponent:0)
                StrSelect = arrData[0][strSelectedRow1]

            }
            else {
                let strSelectedRow  = SelectionPicker.selectedRow(inComponent:2)
                print("sel Value : \(strSelectedRow)")
                strSelectCom = arrData[2][strSelectedRow]
            }
            
            if StrSelect == ""  {
                StrSelect = "\(arrData[0][0])"
            }
             if strSelectCom == "" {
                strSelectCom = "\(arrData[2][0])"
            }
            txtTime.text = "Mon-Sun \(StrSelect)AM - \(strSelectCom) PM "

            dictData["hours_from"] = StrSelect
            dictData["hours_to"] = strSelectCom

        }

    }

    
    
    //MARK:- Check Validation
    func checkValidation() {
        self.view.endEditing(true)
        guard let strCooking = txtCooking.text,  strCooking.count > 0 else {
            Utils.showMessage(type: .error, message:"Please select field of passionate about cooking")
        return
    }
        
        guard let strTime = txtTime.text,  strTime.count > 0 else {
            Utils.showMessage(type: .error, message:"Please select service time")
        return
    }
        
        guard let strPass = txtPassword.text,  strPass.count > 0 else {
          Utils.showMessage(type: .error, message:"Please enter password")
        return
    }
        if txtPassword.text!.count < 6 {
            Utils.showMessage(type: .error, message:"Your password should contain min 6 characters")
            return
        }
        
        if  isImagePicked == false {
            Utils.showMessage(type: .error, message: "Please upload certificate")
            return
        }
      callApi()
    }
    
    //MARK:- ApiCall
    func callApi() {
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        let headers: HTTPHeaders = [
                    "Content-type": "multipart/form-data"
                ]
        let urlReq = ApiList.URL.Host  + ApiList.URL.Auth.registerEndpoint

        var strServiceType = String()
        var strPassionateCooking = String()

        if btnDelivery.isSelected == true {
            strServiceType = "Deliver"
        } else {
            strServiceType = "Pickup"
        }
        
        if txtCooking.text  == "Yes"  {
            strPassionateCooking = "0"
         }
        else {
            strPassionateCooking = "1"
        }
        var param = ["name":dictData["name"] as! String,"email":dictData["email"],"phone":dictData["phone"]as! String,"password":txtPassword.text!,"city":dictData["city"]as! String,"postcode":dictData["postcode"]as! String,"address":dictData["address"] as! String,"service_type":strServiceType,"is_cooking_passionate":strPassionateCooking,"hours_from":dictData["hours_from"]as! String,"hours_to":dictData["hours_to"] as! String,"app_secret":"lara_food_321"]
        //profile_pic
         if dictData["image"]as? UIImage  == nil {
            param["logo"] = ""
        }

        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in param {
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
            multipartFormData.append(self.imgCerti.image!.pngData()!, withName: "certificate", fileName: "\(Date.init().timeIntervalSince1970).png", mimeType: "image/png")
            if dictData["image"]as? UIImage  != nil{
                 let profileimagetoDataConvert = (dictData["image"] as! UIImage).pngData()
                multipartFormData.append(profileimagetoDataConvert!, withName: "logo", fileName: "\(Date.init().timeIntervalSince1970).png", mimeType: "image/png")
            }
        },
        to: urlReq, method: .post , headers: headers).uploadProgress(queue: .main, closure: { progress in
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
                        self.dictRegResponse = RegisterModule().initWithDictionary(dictionary: dicResponseData)
                        if self.dictRegResponse.status == true
                        {
                            Utils.showMessage(type: .success, message: "OTP sent to your registered email id")
                        let nextVC  = STORYBOARD.instantiateViewController(withIdentifier: "PassWordVarificationVC") as! PassWordVarificationVC
                            nextVC.getEmail = dictData["email"] as? String ?? ""
                            self.navigationController?.pushViewController(nextVC, animated: true)
                        }
                        else {
                            let errorDict = dicResponseData["errMsg"]?.dictionary
                            let arry = Array(errorDict!)[0].value
                            print("Array:\(arry)")
                            let showMsg = arry[0].string
                            Utils.showMessage(type: .error, message: showMsg!)
                        }
                    }
                    }
                
            })
      }
}
