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
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view1.layer.cornerRadius = 15.0
        view2.layer.cornerRadius = 15.0
        view3.layer.cornerRadius = 15.0
        
    }
    

}
