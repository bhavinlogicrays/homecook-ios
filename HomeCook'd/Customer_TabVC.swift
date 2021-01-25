//
//  Customer_TabVC.swift
//  HomeCook'd
//
//  Created by admin on 21/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import UIKit

class Customer_TabVC: UIViewController {
    
    // MARK: - Variables
    var objVC1: HomeVC?
    var objVC2: CartVC?
    var objVC3: FavVC?
    var objVC4: Customer_NotificationVC?
    var buttons = [Any]()
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    var btnTemp: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var BottomView: UIView!
    @IBOutlet weak var imgTab1: UIImageView!
    @IBOutlet weak var imgTab2: UIImageView!
    @IBOutlet weak var imgTab3: UIImageView!
    @IBOutlet weak var imgTab4: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblcart: UILabel!
    @IBOutlet weak var lblfav: UILabel!
    @IBOutlet weak var LblNot: UILabel!
    
    
    private var shapeLayer: CALayer?

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BottomView.layer.cornerRadius = 10
        BottomView.layer.borderWidth  = 1
        BottomView.layer.borderColor = UIColor.clear.cgColor
        BottomView.layer.masksToBounds = true

        objVC1 = STORYBOARD.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        objVC2 = STORYBOARD.instantiateViewController(withIdentifier: "CartVC") as? CartVC
        objVC3 = STORYBOARD.instantiateViewController(withIdentifier: "FavVC") as? FavVC
        objVC4 = STORYBOARD.instantiateViewController(withIdentifier: "Customer_NotificationVC") as? Customer_NotificationVC
        
        buttons =  [btn1,btn2,btn3,btn4]
        viewControllers = [objVC1, objVC2, objVC3, objVC4] as? [UIViewController]
        
        self.onClickTab(buttons[selectedIndex] as! UIButton)
    }
    
 

    
    override func viewWillAppear(_ animated: Bool) {
        if DELEGATE.isPayment == true {
            selectedIndex = 0
            self.onClickTab(buttons[selectedIndex] as! UIButton)
        }

    }
    @IBAction func onClickTab(_ sender: UIButton) {
       // if (sender == btn3) {
            //self.navigationController?.pushViewController(objVC3!, animated: true)
           // return;
       // }
        
        if sender == btnTemp {
            return;
        }
        
        btnTemp = sender
        
        imgTab1.image = UIImage(named: "home_unsel")
        imgTab2.image = UIImage(named: "bag_unsel")
        imgTab3.image = UIImage(named: "heart_unsel")
        imgTab4.image = UIImage(named: "notification_unsel")
              
        lblHome.textColor = UIColor.init(hexString: "#AFAFAF")
        lblcart.textColor = UIColor.init(hexString: "#AFAFAF")
        lblfav.textColor = UIColor.init(hexString: "#AFAFAF")
        LblNot.textColor = UIColor.init(hexString: "#AFAFAF")

        if(btnTemp == btn1){
            imgTab1.image = UIImage(named: "home_sel")
            lblHome.textColor = UIColor.init(hexString: "#EB3943")

        }
        else if(btnTemp == btn2) {
            imgTab2.image = UIImage(named: "bag_sel")
            lblcart.textColor = UIColor.init(hexString: "#EB3943")

        }
        else if(btnTemp == btn3) {
            imgTab3.image = UIImage(named: "heart_sel")
            lblfav.textColor = UIColor.init(hexString: "#EB3943")

        }
        else if(btnTemp == btn4) {
            imgTab4.image = UIImage(named: "notification_sel")
            LblNot.textColor = UIColor.init(hexString: "#EB3943")

        }
        
        let previousIndex = selectedIndex
        selectedIndex = btnTemp.tag
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let selectedVC = viewControllers[selectedIndex]
        addChild(selectedVC)
        selectedVC.view.frame = containerView.bounds
        containerView.addSubview(selectedVC.view)
        selectedVC.didMove(toParent: self)
        
    }
        
    
    
   
}
