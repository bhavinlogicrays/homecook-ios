//
//  PaymentWithdrawVC.swift
//

import UIKit

class PaymentWithdrawVC: UIViewController {

    // MARK: - Variables
    // MARK: - UI Controls
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view1.layer.cornerRadius = 15.0
        view2.layer.cornerRadius = 15.0
        view3.layer.cornerRadius = 15.0
        view4.layer.cornerRadius = 15.0
    }
    @IBAction func onClickPerInf(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PersonalInfoVC") as! PersonalInfoVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickSetting(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickAccBal(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PaymentWithdrawVC2") as! PaymentWithdrawVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickDel(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "RevenueVC") as! RevenueVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickNumOfOrder(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TotalOrdersVC") as! TotalOrdersVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickUseRev(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "ReViewVC") as! ReViewVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickLogOut(_ sender: Any) {
        isPayment = false
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "WelComeVC") as! WelComeVC
        isLogin = false
        self.navigationController?.pushViewController(objVC, animated: true)
        
    }
    
}
