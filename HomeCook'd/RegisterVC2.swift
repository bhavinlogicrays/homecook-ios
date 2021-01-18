//
//  RegisterVC2.swift
//

import UIKit


class RegisterVC2: UIViewController,UITextFieldDelegate {
    
    // MARK:- Variables
    
    // MARK:- UIControls
    @IBOutlet weak var lblCertificate: UILabel!
    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var txtCooking: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DELEGATE.setCorner(button: btnRegister)
        DELEGATE.setBorder(textField: txtCooking)
        DELEGATE.setBorder(textField: txtTime)
        DELEGATE.setBorder(textField: txtPassword)
        setDashPattern(view: viewPhoto)
        
        txtPassword.attributedPlaceholder = NSAttributedString(string:"********", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPassword.setRightPaddingPoints(15)
        txtPassword.setLeftPaddingPoints(15)
        
        txtTime.attributedPlaceholder = NSAttributedString(string:"Sun-Mon,10:00 AM- 11:00 PM", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtTime.setRightPaddingPoints(15)
        txtTime.setLeftPaddingPoints(15)
        
        txtCooking.attributedPlaceholder = NSAttributedString(string:"Select", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtCooking.setRightPaddingPoints(15)
        txtCooking.setLeftPaddingPoints(15)
        
    }

    // MARK: - UI Methods
        func setDashPattern(view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = [5.0, 5.0]
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: SCREEN_WIDTH - 48.0, height: view.frame.size.height)
        shapeLayer.fillColor = nil
        shapeLayer.path = UIBezierPath(roundedRect: shapeLayer.frame, cornerRadius: 10.0).cgPath
        view.layer.addSublayer(shapeLayer)
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
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

