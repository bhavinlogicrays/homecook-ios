//
//  PaymentSuccessVC.swift
//

import UIKit

class PaymentSuccessVC: UIViewController {

    // MARK: - Variables
    
    // MARK: - UIControls
    @IBOutlet weak var btnOk: UIButton!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DELEGATE.setCorner(button: btnOk)
    }

    @IBAction func onClickOk(_ sender: UIButton) {
//        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "DashBoardVC") as! DashBoardVC
//        self.navigationController?.pushViewController(objVC, animated: true)
        
        self.navigationController?.popToViewController(ofClass: TabVC.self)
    }
}
