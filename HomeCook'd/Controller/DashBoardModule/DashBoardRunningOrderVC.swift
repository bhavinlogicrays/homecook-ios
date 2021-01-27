//
//  DashBoardRunningOrderVC.swift
//

import UIKit

protocol DashBoardRunningOrderVCDelegate: class {
    func didPressedLogout()
}

class DashBoardRunningOrderVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK:- Variables
    var arrFood = [String]()
    weak var delegate : DashBoardRunningOrderVCDelegate?
    var bottomPadding: CGFloat = 50.0
    
    // MARK:- UIControls
    @IBOutlet weak var tblViewRunningOrder: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         arrFood = ["Thai veg food","veg thai","vegan thai curry","veganPad","vegetable pad thai","vegetarian thai food","vegetarian thai"]
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardRunningOrderVCCell") as! DashBoardRunningOrderVCCell
        
        cell.imgFood.image = UIImage(named: arrFood[indexPath.row])
        cell.lblInvoice.text = "12345"
        cell.lblFoodName.text = "Vegetable Thai Food"
        cell.lblFoodType.text = "Breakfast"
        cell.lblFoodPrice.text = "$50"
        
        return cell
    }

}

