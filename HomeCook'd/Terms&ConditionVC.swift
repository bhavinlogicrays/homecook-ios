//
//  Terms&ConditionVC.swift
//

import UIKit

class Terms_ConditionVC: UIViewController {

    @IBOutlet weak var viewCondition: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewCondition.layer.cornerRadius = 21.0
        
    }
    
    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
