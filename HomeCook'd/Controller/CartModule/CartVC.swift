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
        
        setUI()
        
        arrFoodImg = [["img":"cart-img1","name":""],["img":"cart-img2"],["img":"cart-img3"]] as [[String : AnyObject]]
    }
    
    func setUI(){
        viewCheckOut.layer.cornerRadius = 25
        viewCheckOut.layer.masksToBounds = true
        viewCheckOut.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
    
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "", handler: {a,b,c in
            // example of your delete function
            self.arrFoodImg.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            let backView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            backView.backgroundColor = #colorLiteral(red: 0.933103919, green: 0.08461549133, blue: 0.0839477703, alpha: 1)
            
            backView.layer.cornerRadius = 20
            backView.layer.masksToBounds = true
            
            let myImage = UIImageView(frame: CGRect(x: 30, y: backView.frame.size.height/2-14, width: 16, height: 16))
            myImage.image = #imageLiteral(resourceName: "delete-item")
            backView.addSubview(myImage)
        })

        deleteAction.image = UIImage(named: "trash.png")
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    @IBAction func onClickCheckout(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_PaymentVC") as! Customer_PaymentVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
}
