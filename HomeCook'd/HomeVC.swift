//
//  HomeVC.swift
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource,HomeVCCellDelegate {

    // MARK: - Variables
    var arrFoodImg = [String]()
    var arrChefImg = [String]()
    var arrDelTime = [String]()
    var arrHomeCook = [String]()
    var isViewOpen:String = ""
    
    // MARK: - UI Controls
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnDelivery: UIButton!
    @IBOutlet weak var btnPickUp: UIButton!
    @IBOutlet weak var tblViewMostPop: UITableView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var subBtnDel: UIView!
    @IBOutlet weak var subBtnPick: UIButton!
    @IBOutlet weak var subBtnTime1: UIButton!
    @IBOutlet weak var subBtnTime2: UIButton!
    @IBOutlet weak var subBtnTime3: UIButton!
    @IBOutlet weak var subRat1: UIButton!
    @IBOutlet weak var subRat2: UIButton!
    @IBOutlet weak var subRat3: UIButton!
    @IBOutlet weak var subRat4: UIButton!
    @IBOutlet weak var subRat5: UIButton!
    @IBOutlet weak var btnApply: UIButton!
    
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgView.layer.cornerRadius = imgView.frame.size.height/2
        imgView.layer.masksToBounds = true
        
        txtSearch.attributedPlaceholder = NSAttributedString(string:"Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 114.0/255.0, green: 114.0/255.0, blue: 114.0/255.0, alpha: 1.0)])
        txtSearch.setLeftPaddingPoints(15)
        txtSearch.setRightPaddingPoints(15)
        txtSearch.layer.cornerRadius = 10.0
        txtSearch.layer.masksToBounds = false
        
        btnFilter.layer.cornerRadius = 6.0
        btnFilter.layer.masksToBounds = true
        
        btnApply.layer.cornerRadius = 6.0
        btnApply.layer.masksToBounds = true
        
        btnDelivery.layer.cornerRadius = btnDelivery.frame.size.height/2
        btnPickUp.layer.cornerRadius = btnPickUp.frame.size.height/2
        
        subBtnDel.layer.cornerRadius = subBtnDel.frame.size.height/2
        subRat4.layer.cornerRadius = subRat4.frame.size.height/2
        subBtnTime1.layer.cornerRadius = subRat4.frame.size.height/2
        setCorner(btn: subBtnPick)
        setCorner(btn: subBtnTime2)
        setCorner(btn: subBtnTime3)
        setCorner(btn: subRat1)
        setCorner(btn: subRat2)
        setCorner(btn: subRat3)
        setCorner(btn: subRat5)
        
        subView.layer.cornerRadius = 25.0
        subView.layer.masksToBounds = true
        
        arrFoodImg = ["food-img-big","food-img2-big","food-img-big","food-img2-big","food-img-big","food-img2-big","food-img-big"]
        arrChefImg = ["chef-1","chef-2","chef-1","chef-2","chef-1","chef-2","chef-1"]
        arrDelTime = ["Delivery 20 min","Pick Up 1.5 km","Delivery 20 min","Pick Up 1.5 km","Delivery 20 min","Pick Up 1.5 km","Pick Up 1.5 km"]
        arrHomeCook = ["Friends HomeCooke'd","Duhari HomeCooke'd ","Friends HomeCooke'd","Duhari HomeCooke'd","Friends HomeCooke'd","Duhari HomeCooke'd","Friends HomeCooke'd"]
        
        isViewOpen = ""
        subView.isHidden = true

        
       
    }
    
    func setCorner(btn: UIButton){
        btn.layer.cornerRadius = btn.frame.size.height/2
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.init(red: 200.0/255.0, green: 205.0/255.0, blue: 211.0/255.0, alpha: 1.0).cgColor
    }
    
    @IBAction func onClickFilter(_ sender: Any) {
        isViewOpen = "1"
        subView.isHidden = false

    }
    
    @IBAction func btnProfileClick(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func btnApplyClick(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickClose(_ sender: Any) {
        if isViewOpen == "1" {
            subView.isHidden = true
        }
        else{
            subView.isHidden = false

        }

    }
    
    @IBAction func onClickSerch(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func btnDeliveryClick(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC2") as! AddressVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    
    
    // MARK: - Delegate Method
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFoodImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeVCCell") as! HomeVCCell
        
        cell.delegate = self
        cell.imgFood.image = UIImage(named: arrFoodImg[indexPath.row])
        cell.imgFood.layer.cornerRadius = 20.0
        cell.imgFood.layer.masksToBounds = true
        
        cell.imgChef.image = UIImage(named: arrChefImg[indexPath.row])
        cell.imgChef.layer.cornerRadius = cell.imgChef.frame.size.height / 2
//        cell.imgChef.layer.borderColor = UIColor.white.cgColor
//       cell.imgChef.layer.borderWidth = 2.0
        
        //
        cell.lblDelTime.text = arrDelTime[indexPath.row]
        cell.lblDelTime.layer.cornerRadius = cell.lblDelTime.frame.size.height/2
        cell.lblDelTime.layer.masksToBounds = true
        
        cell.lblHomeCook.text = arrHomeCook[indexPath.row]
        
        return cell
        
    }
    
    
    // MARK: - HomeVCCell
    func didPressOnCell(_ Index: Int) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "HomeVC3") as! HomeVC3
        self.navigationController?.pushViewController(objVC, animated: true)
    }

}
