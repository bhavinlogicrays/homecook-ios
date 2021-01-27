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
        
//        viewCheckOut.layer.cornerRadius = 33.0
        
        viewCheckOut.layer.cornerRadius = 25
        viewCheckOut.layer.masksToBounds = true
        viewCheckOut.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
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
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        
        self.tblViewCart.deleteRows(at: [indexPath], with: .automatic)
        self.arrFoodImg.remove(at: indexPath.row)

      }
    }


    @IBAction func onClickCheckout(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_PaymentVC") as! Customer_PaymentVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
}
