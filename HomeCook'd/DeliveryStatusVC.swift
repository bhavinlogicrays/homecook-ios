//
//  DeliveryStatusVC.swift
//

import UIKit

class DeliveryStatusVC: UIViewController {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewTrackOrder: UIView!
    @IBOutlet weak var btnMapView: UIButton!
    @IBOutlet weak var viewCall: UIView!
    @IBOutlet weak var imgCall: UIImageView!
    
    // MARK: - ViewControllers Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewTrackOrder.layer.cornerRadius = 16.0
        viewTrackOrder.layer.borderWidth = 1.0
        viewTrackOrder.layer.borderColor = UIColor.init(red: 245.0/255.0, green: 245.0/255.0, blue: 248.0/255.0, alpha: 1.0).cgColor
        
        btnMapView.layer.cornerRadius = btnMapView.frame.size.height/2
        
        viewCall.layer.cornerRadius = 33.0
        
        imgCall.layer.cornerRadius = imgCall.frame.size.height/2
    }
    
    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnMapViewClick(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "TrackingOrderVC") as! TrackingOrderVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
   

}
