//
//  TrackingOrderVC.swift
//

import UIKit

class TrackingOrderVC: UIViewController {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewTrack: UIView!
    @IBOutlet weak var viewCall: UIView!
    @IBOutlet weak var imgCall: UIImageView!
    
    // MARK: - ViewControllers Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewTrack.layer.cornerRadius = 25.0
        
        viewCall.layer.cornerRadius = 33.0
        
        imgCall.layer.cornerRadius = imgCall.frame.size.height/2
    }
    
    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
 

}
