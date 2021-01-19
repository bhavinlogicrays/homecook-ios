//
//  RatingVC.swift
//

import UIKit

class RatingVC: UIViewController {

    // MARK: - Variables
    // MARK: - UI Controls
    @IBOutlet weak var txtViewCmnt: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtViewCmnt.layer.cornerRadius = 10.0
        txtViewCmnt.layer.borderColor = UIColor.init(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0).cgColor
        txtViewCmnt.layer.borderWidth = 1.0
        
        btnSubmit.layer.masksToBounds = false
        btnSubmit.layer.cornerRadius = 10.0
        btnSubmit.layer.borderWidth = 1.0
        btnSubmit.layer.borderColor = UIColor.init(red: 235.0/255.0, green: 57.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor
    }
    

   

}
