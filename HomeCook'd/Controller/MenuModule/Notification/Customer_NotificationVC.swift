//
//  Customer_NotificationVC.swift
//

import UIKit

class Customer_NotificationVC: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    // MARK: - Variables
    var arrImg = [String]()
    var arrFoodName = [String]()
    var arrProgress = [String]()
    
    // MARK: - UIControls
    @IBOutlet weak var tblViewNotification: UITableView!
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblMessege: UILabel!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
        
        arrImg  = ["cart-img1","cart-img2","cart-img3","cart-img1"]
        arrFoodName = ["Vegetable Thai Food","Vegetable Thai Food","Keema Chickeniriyani","Mazali Chicken halim"]
        arrProgress = ["In Progress","In Progress","Complete","Canceled"]
    }
    
    // MARK: - UI Methods
    func setUI(){
    lblNotification.layer.cornerRadius = lblNotification.frame.size.height/2
    lblNotification.layer.masksToBounds = true
     
    lblMessege.layer.cornerRadius = lblMessege.frame.size.height/2
    lblMessege.layer.borderWidth = 1.0
    lblMessege.layer.borderColor = UIColor.lightGray.cgColor
    lblMessege.layer.masksToBounds = true
    }
    
    // MARK: - IBAction Methods
    
    // MARK: - Delegate Methods
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Customer_NotificationVCCell") as! Customer_NotificationVCCell
        
        cell.imgProfile.image = UIImage(named: arrImg[indexPath.row])
        cell.lblFoodName.text = arrFoodName[indexPath.row]
        cell.cellView.layer.cornerRadius = 20.0
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.size.height/2
        cell.imgProfile.layer.masksToBounds = true
        cell.lblProgrs.text = arrProgress[indexPath.row]
        cell.lblProgrs.layer.cornerRadius = cell.lblProgrs.frame.size.height/2
        cell.lblProgrs.layer.masksToBounds = true
        
        return cell
    }

    @IBAction func onClickMassege(_ sender: Any) {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MessegesVC") as! MessegesVC
            self.navigationController?.pushViewController(objVC, animated: true)

    }
}
