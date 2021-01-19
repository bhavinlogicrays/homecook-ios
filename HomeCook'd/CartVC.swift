//
//  CartVC.swift
//

import UIKit

class CartVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    // MARK: - Variables
     var arrFoodImg = [[String:AnyObject]]  ()
    
    // MARK: - UIControls
    @IBOutlet weak var tblViewCart: UITableView!
    @IBOutlet weak var viewCheckOut: UIView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewCheckOut.layer.cornerRadius = 33.0
        
        arrFoodImg = [["img":"cart-img1","name":""],["img":"cart-img2"],["img":"cart-img3"]] as [[String : AnyObject]]
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFoodImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "CartVCCell") as! CartVCCell
        
        cell.cartImg.image = UIImage(named: arrFoodImg[indexPath.row]["img"] as! String)
        cell.cartImg.layer.cornerRadius = cell.cartImg.frame.size.height/2
        cell.cellView.layer.cornerRadius = 20.0
        
        return cell
    }
    
    
}
