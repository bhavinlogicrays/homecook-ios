//
//  PaymentWithdrawVC2.swift
//

import UIKit

class PaymentWithdrawVC2: UIViewController {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewCurrBal: UIView!
    @IBOutlet weak var btnWithdraw: UIButton!
    @IBOutlet weak var viewHistory: UIView!
    @IBOutlet weak var viewWithdraw: UIView!
    @IBOutlet weak var viewRecpts: UIView!
    @IBOutlet weak var viewInvoice: UIView!
    
    // MARK: -ViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewCurrBal.layer.cornerRadius = 15.0
        viewCurrBal.layer.borderColor = UIColor.init(red: 255.0/255.0, green: 208.0/255.0, blue: 191.0/255.0, alpha: 1.0).cgColor
        viewCurrBal.layer.borderWidth = 1.0
        
        CommonManager.setCorner(button: btnWithdraw)
        
        setBorder(view: viewHistory)
        setBorder(view: viewWithdraw)
        setBorder(view: viewRecpts)
        setBorder(view: viewInvoice)
    }
    
    // MARK: - UI Methods
    func setBorder(view:UIView){
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0).cgColor
    }
  
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickWithdraw(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PaymentMethodVC") as! PaymentMethodVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
}
