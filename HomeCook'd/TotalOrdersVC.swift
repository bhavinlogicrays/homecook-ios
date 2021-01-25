//
//  TotalOrdersVC.swift
//

import UIKit

class TotalOrdersVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    // MARK: - Variables
    var arrImg = [String]()
    var arrFoodName = [String]()
    var arrProgress = [String]()
    
    // MARK: - UIControls
    @IBOutlet weak var tblViewTotalOrders: UITableView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        arrImg  = ["cart-img1","cart-img2","cart-img3","cart-img1"]
        arrFoodName = ["Vegetable Thai Food","Vegetable Thai Food","Keema Chickeniriyani","Mazali Chicken halim"]
        arrProgress = ["In Progress","In Progress","Complete","Canceled"]
    }
    
    // MARK: - UI Methods
    // MARK: - IBAction Methods
    
    // MARK: - Delegate Methods
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TotalOrderVCCell") as! TotalOrderVCCell
        
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

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
