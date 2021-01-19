//
//  TabVC.swift
//

import UIKit

class TabVC: UIViewController {

    // MARK: - Variables
    var objVC1: DashBoardVC?
    var objVC2: MyFoodVC?
    var objVC3: AddNewItemVC?
    var objVC4: NotificationVC?
    var objVC5: PaymentWithdrawVC?
    var buttons = [Any]()
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    var btnTemp: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgTab1: UIImageView!
    @IBOutlet weak var imgTab2: UIImageView!
    @IBOutlet weak var imgTab3: UIImageView!
    @IBOutlet weak var imgTab4: UIImageView!
    @IBOutlet weak var imgTab5: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        containerView.layer.cornerRadius = 20.0
//        containerView.layer.masksToBounds =true
        
        
        objVC1 = STORYBOARD.instantiateViewController(withIdentifier: "DashBoardVC") as? DashBoardVC
        objVC2 = STORYBOARD.instantiateViewController(withIdentifier: "MyFoodVC") as? MyFoodVC
        objVC3 = STORYBOARD.instantiateViewController(withIdentifier: "AddNewItemVC") as? AddNewItemVC
        objVC4 = STORYBOARD.instantiateViewController(withIdentifier: "NotificationVC") as? NotificationVC
        objVC5 = STORYBOARD.instantiateViewController(withIdentifier: "PaymentWithdrawVC") as? PaymentWithdrawVC
        
        buttons =  [btn1,btn2,btn3,btn4,btn5]
        viewControllers = [objVC1, objVC2, objVC3, objVC4, objVC5] as? [UIViewController]
        
        self.onClickTab(buttons[selectedIndex] as! UIButton)
    }
    
    @IBAction func onClickTab(_ sender: UIButton) {
        if (sender == btn3) {
            self.navigationController?.pushViewController(objVC3!, animated: true)
            return;
        }
        
        if sender == btnTemp {
            return;
        }
        
        btnTemp = sender
        
        imgTab1.image = UIImage(named: "unsel_dashboard.png")
        imgTab2.image = UIImage(named: "unsel_menu.png")
        imgTab3.image = UIImage(named: "Plus-1")
        imgTab4.image = UIImage(named: "unsel_notification.png")
        imgTab5.image = UIImage(named: "unsel_profile.png")
                
        if(btnTemp == btn1){
            imgTab1.image = UIImage(named: "sel_dashboard.png")
        }
        else if(btnTemp == btn2) {
            imgTab2.image = UIImage(named: "sel_menu.png")
        }
        else if(btnTemp == btn3) {
            imgTab3.image = UIImage(named: "sel_plus.png")
        }
        else if(btnTemp == btn4) {
            imgTab4.image = UIImage(named: "sel_notification.png")
        }else {
            imgTab5.image = UIImage(named: "sel_profile.png")
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