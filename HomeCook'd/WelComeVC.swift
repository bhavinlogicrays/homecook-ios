//
//  ViewController.swift
//

import UIKit

class WelComeVC: UIViewController {

    // MARK: - Variables
    
    // MARK: - UIControls
    @IBOutlet weak var btnChef: UIButton!
    @IBOutlet weak var btnCustomer: UIButton!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnChef.layer.cornerRadius = 10.0
        btnChef.layer.masksToBounds = true
        btnChef.clipsToBounds = false
        
        btnCustomer.layer.cornerRadius = 10.0
        btnCustomer.layer.borderWidth = 1.0
        btnCustomer.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0).cgColor
    }

    // MARK: - UI Methods
    // MARK: - IBAction Methods
    @IBAction func onClickChef(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickCustomer(_ sender: Any) {
    }
    
}

