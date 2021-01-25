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
        btnChef.layer.borderWidth = 1.0
//        btnChef.layer.masksToBounds = true
//        btnChef.clipsToBounds = false
//
        btnCustomer.layer.cornerRadius = 10.0
        btnCustomer.layer.borderWidth = 1.0
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
                btnChef.isSelected = false
                btnCustomer.isSelected = false
        
        btnChef.backgroundColor = UIColor.clear.withAlphaComponent(0.26)
        btnCustomer.backgroundColor = UIColor.clear.withAlphaComponent(0.26)

        btnChef.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0).cgColor
        btnCustomer.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0).cgColor

    }

    // MARK: - UI Methods
    // MARK: - IBAction Methods
    @IBAction func onClickChef(_ sender: Any) {
        
        btnChef.isSelected = true
        btnCustomer.isSelected = false

        btnChef.backgroundColor = UIColor.init(hexString: "#EB3943")
        btnCustomer.backgroundColor = UIColor.clear.withAlphaComponent(0.26)
        btnChef.layer.borderColor = UIColor.clear.cgColor
        btnCustomer.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0).cgColor
        
        
        DELEGATE.strIsComefrom = "Chef"
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        objVC.strSetTitle = "Register"
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickCustomer(_ sender: Any) {
        
        btnChef.isSelected = false
        btnCustomer.isSelected = true
        DELEGATE.strIsComefrom = "Customer"

        btnCustomer.backgroundColor = UIColor.init(hexString: "#EB3943")
        btnChef.backgroundColor = UIColor.clear.withAlphaComponent(0.26)
        btnCustomer.layer.borderColor = UIColor.clear.cgColor
        btnChef.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0).cgColor

        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        objVC.strSetTitle = "Create Account"
        self.navigationController?.pushViewController(objVC, animated: true)
        
    }
    
}

