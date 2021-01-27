//
//  DashBoardOrderRequestVC.swift
//

import UIKit

protocol DashBoardOrderRequestVCDelegate: class {
    func didPressedLogout()
}

class DashBoardOrderRequestVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK:- Variables
    var arrFood = [String]()
    weak var delegate : DashBoardOrderRequestVCDelegate?
    var bottomPadding: CGFloat = 50.0
    
    // MARK:- UIControls
    @IBOutlet weak var tblViewOrderRequest: UITableView!
    
    // MARK: - ViewController Methods
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardOrderRequestVCCell") as! DashBoardOrderRequestVCCell
        
        cell.imgFood.image = UIImage(named: arrFood[indexPath.row])
        cell.lblInvoice.text = "12345"
        cell.lblFoodName.text = "Vegetable Thai Food"
        cell.lblFoodType.text = "Breakfast"
        cell.lblFoodPrice.text = "$50"
        
        return cell
    }

}
