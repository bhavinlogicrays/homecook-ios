//
//  NotificationVC.swift
//

import UIKit

class NotificationVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // MARK: - Variables
    var arrImg = [String]()
    var arrFood = [String]()
    
    
    // MARK: - UI Controls
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblMessege: UILabel!
    @IBOutlet weak var tblViewNotifi: UITableView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       lblNotification.layer.cornerRadius = lblNotification.frame.size.height/2
       lblNotification.layer.masksToBounds = true
        
       lblMessege.layer.cornerRadius = lblMessege.frame.size.height/2
       lblMessege.layer.borderWidth = 1.0
       lblMessege.layer.borderColor = UIColor.lightGray.cgColor
       lblMessege.layer.masksToBounds = true
        
         arrImg = ["chef-img","chef-img","chef-img","chef-img"]
         arrFood = ["veg thai","vegan thai curry","veganPad","vegetable pad thai"]
    }
    
    // MARK: - UI Methods
    // MARK: - IBAction Methods
    
    // MARK: - Delegate Methods
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationVCCell") as! NotificationVCCell
        
        cell.imgProfile.image = UIImage(named: arrImg[indexPath.row])
        cell.imgFood.image = UIImage(named: arrFood[indexPath.row])
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.size.height/2
        cell.imgProfile.layer.masksToBounds = true
        cell.imgFood.layer.cornerRadius = 10.0
        cell.imgFood.layer.masksToBounds = true
        
        return cell
    }
    
    
    @IBAction func onClickMassege(_ sender: Any) {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MessegesVC") as! MessegesVC
            self.navigationController?.pushViewController(objVC, animated: true)

    }
}
