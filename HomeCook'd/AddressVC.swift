//
//  AddressVC.swift
//

import UIKit

class AddressVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - Variables
    var arrImg = [[String:AnyObject]]  ()
    
    // MARK: - UIControls
    @IBOutlet weak var tblAdress: UITableView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        arrImg = [["img":"work-ic","name":"Home","address":"2464 Royal Ln. Mesa, New Jersey 45463"],["img":"home-ic","name":"Work","address":"3891 Ranchview Dr. Richardson, California 62639"]] as [[String : AnyObject]]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressVCCell") as! AddressVCCell
        
        cell.imgView.image = UIImage(named: arrImg[indexPath.row]["img"] as! String)
        cell.lblName.text  = arrImg[indexPath.row]["name"] as? String ?? ""
        cell.lblAdrs.text  = arrImg[indexPath.row]["address"] as? String ??  ""
        cell.cellView.layer.cornerRadius = 20.0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
  
}
