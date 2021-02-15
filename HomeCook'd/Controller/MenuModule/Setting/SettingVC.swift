//
//  SettingVC.swift
//

import UIKit

class SettingVC: UIViewController {

    let onColor  =  UIColor.init(hexString: "#EB3943")
    let offColor  =  UIColor.init(hexString: "#000000")

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewLang: UIView!
    @IBOutlet weak var viewNotification: UIView!
    @IBOutlet weak var switPushNoti: UISwitch!
    @IBOutlet weak var switEmailNoti: UISwitch!


    // MARK: - ViewController Methods
    override func viewDidLoad() {
       
        super.viewDidLoad()

        viewLang.layer.cornerRadius = 15.0
        viewNotification.layer.cornerRadius = 15.0
    }
    
    

//MARK:- IBAction
    @IBAction func switchChangeValue(_ sender:AnyObject) {
        
        if switPushNoti.isOn  {
            switPushNoti.isOn = true
          switPushNoti.thumbTintColor = onColor
        }
        else {
            switPushNoti.isOn = false
          switPushNoti.thumbTintColor = offColor
        }
        switPushNoti.onTintColor = UIColor.white

    }
    
    @IBAction func switchEmailChangeValue(_ sender:AnyObject) {
        if switEmailNoti.isOn  {
            switEmailNoti.isOn = true
            switEmailNoti.thumbTintColor = onColor
        }
        else {
            switEmailNoti.isOn = false
            switEmailNoti.thumbTintColor = offColor
        }
        switEmailNoti.onTintColor = UIColor.white
        
    }

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
