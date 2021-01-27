//
//  SettingVC.swift
//

import UIKit

class SettingVC: UIViewController {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewLang: UIView!
    @IBOutlet weak var viewNotification: UIView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewLang.layer.cornerRadius = 15.0
        viewNotification.layer.cornerRadius = 15.0
    }

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
