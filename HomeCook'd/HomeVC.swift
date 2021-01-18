//
//  HomeVC.swift
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // MARK: - Variables
    var arrFoodImg = [String]()
    var arrChefImg = [String]()
    var arrDelTime = [String]()
    var arrHomeCook = [String]()
    
    // MARK: - UI Controls
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnDelivery: UIButton!
    @IBOutlet weak var btnPickUp: UIButton!
    @IBOutlet weak var tblViewMostPop: UITableView!
    
    
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
        
        btnDelivery.layer.cornerRadius = btnDelivery.frame.size.height/2
        btnPickUp.layer.cornerRadius = btnPickUp.frame.size.height/2
        
        
        arrFoodImg = ["food-img-big","food-img2-big","food-img-big","food-img2-big","food-img-big","food-img2-big","food-img-big"]
        arrChefImg = ["chef-1","chef-2","chef-1","chef-2","chef-1","chef-2","chef-1"]
        arrDelTime = ["Delivery 20 min","Pick Up 1.5 km","Delivery 20 min","Pick Up 1.5 km","Delivery 20 min","Pick Up 1.5 km","Pick Up 1.5 km"]
        arrHomeCook = ["Friends HomeCooke'd","Duhari HomeCooke'd ","Friends HomeCooke'd","Duhari HomeCooke'd","Friends HomeCooke'd","Duhari HomeCooke'd","Friends HomeCooke'd"]
    }
    
    // MARK: - Delegate Method
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFoodImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeVCCell") as! HomeVCCell
        
        cell.imgFood.image = UIImage(named: arrFoodImg[indexPath.row])
        cell.imgFood.layer.cornerRadius = 20.0
        cell.imgFood.layer.masksToBounds = true
        
        cell.imgChef.image = UIImage(named: arrChefImg[indexPath.row])
//        cell.imgChef.layer.cornerRadius = cell.imgChef.frame.size.height/2
//        cell.imgChef.layer.borderColor = UIColor.white.cgColor
//        cell.imgChef.layer.borderWidth = 2.0
//        cell.imgChef.layer.masksToBounds = true
        
        cell.lblDelTime.text = arrDelTime[indexPath.row]
        cell.lblDelTime.layer.cornerRadius = cell.lblDelTime.frame.size.height/2
        cell.lblDelTime.layer.masksToBounds = true
        
        cell.lblHomeCook.text = arrHomeCook[indexPath.row]
        
        return cell
        
    }

}
