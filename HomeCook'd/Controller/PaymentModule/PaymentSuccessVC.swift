//
//  PaymentSuccessVC.swift
//

import UIKit

class PaymentSuccessVC: UIViewController {

    // MARK: - Variables
    
    // MARK: - UIControls
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnBackToHome: UIButton!
    @IBOutlet weak var lblSuccess: UILabel!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let strgetValue  = UserDefaults.standard.value(forKey: "isLogin") as? String
        if  strgetValue ==  "Chef"  || strgetValue != nil {
            btnBackToHome.isHidden = true
            btnOk.setTitle("Ok", for: .normal)
            lblSuccess.text = "Withdraw Successful"
        }
        else {
            btnBackToHome.isHidden = false
            btnOk.setTitle("Track Order", for: .normal)
            lblSuccess.text = "Payment Successful"
        }

        CommonManager.setCorner(button: btnOk)
        
        btnBackToHome.layer.masksToBounds = false
        btnBackToHome.layer.cornerRadius = 10.0
        btnBackToHome.layer.borderWidth = 1.0
        btnBackToHome.layer.borderColor = UIColor.init(red: 235.0/255.0, green: 57.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor
    }
    @IBAction func onClickBack(_ sender: UIButton) {
//            self.navigationController?.popToViewController(ofClass: Customer_TabVC.self)
        isPayment = true
        self.navigationController?.popToViewController(ofClass: Customer_TabVC.self)

    }


    @IBAction func onClickOk(_ sender: UIButton) {
        
        let strgetValue  = UserDefaults.standard.value(forKey: "isLogin") as? String

        if strgetValue ==  "Chef"  || strgetValue != nil{
            isPayment = true
            self.navigationController?.popToViewController(ofClass: TabVC.self)
        }
        else {
                    let objVC = STORYBOARD.instantiateViewController(withIdentifier: "DeliveryStatusVC") as! DeliveryStatusVC
                    isPayment = false
                    self.navigationController?.pushViewController(objVC, animated: true)

        }
//        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "DashBoardVC") as! DashBoardVC
//        self.navigationController?.pushViewController(objVC, animated: true)
        
    }
}
