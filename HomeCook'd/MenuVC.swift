//
//  MenuVC.swift
//

import UIKit

class MenuVC: UIViewController {

    // MARK: - Variables
    
    // MARK: - UIControls
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var lblNum: UILabel!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view1.layer.cornerRadius = 15.0
        view2.layer.cornerRadius = 15.0
        view3.layer.cornerRadius = 15.0
        
        lblNum.layer.cornerRadius = lblNum.frame.size.height/2
        lblNum.layer.masksToBounds = true
        
    }
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


    @IBAction func onClickPerInf(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PersonalInfoVC") as! PersonalInfoVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickSetting(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickOrder(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_OrderVC") as! Customer_OrderVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickAdrs(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC") as! AddressVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickTerms(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Terms_ConditionVC") as! Terms_ConditionVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickFAQ(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_FAQVC") as! Customer_FAQVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickLogOut(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "WelComeVC") as! WelComeVC
        self.navigationController?.pushViewController(objVC, animated: true)
        
    }
    
}
