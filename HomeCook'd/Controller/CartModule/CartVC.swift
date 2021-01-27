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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

           let backView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 120))
           backView.backgroundColor = #colorLiteral(red: 0.933103919, green: 0.08461549133, blue: 0.0839477703, alpha: 1)

           let myImage = UIImageView(frame: CGRect(x: 30, y: backView.frame.size.height/2-14, width: 50, height: 50))
           myImage.image = #imageLiteral(resourceName: "delete-item")
        
           backView.addSubview(myImage)

           let label = UILabel(frame: CGRect(x: 0, y: myImage.frame.origin.y+14, width: 80, height: 25))
           label.text = "Delete"
           label.textAlignment = .center
           label.textColor = UIColor.white
           label.font = UIFont(name: label.font.fontName, size: 14)
           backView.addSubview(label)

           let imgSize: CGSize = tableView.frame.size
           UIGraphicsBeginImageContextWithOptions(imgSize, false, UIScreen.main.scale)
           let context = UIGraphicsGetCurrentContext()
           backView.layer.render(in: context!)
           let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()

           let delete = UITableViewRowAction(style: .destructive, title: "           ") { (action, indexPath) in
               print("Delete")
           }

           delete.backgroundColor = UIColor(patternImage: newImage)

           return [delete]
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//      if editingStyle == .delete {
//
//        self.tblViewCart.deleteRows(at: [indexPath], with: .automatic)
//        self.arrFoodImg.remove(at: indexPath.row)
//
//      }
//    }

    
    
    @IBAction func onClickCheckout(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "Customer_PaymentVC") as! Customer_PaymentVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
}
