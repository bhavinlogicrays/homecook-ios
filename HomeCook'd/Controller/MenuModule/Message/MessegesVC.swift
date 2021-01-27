//
//  MessegesVC.swift
//

import UIKit

class MessegesVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - Variables
    var arrImg = [String]()
    var arrName = [String]()
    var arrCmnt = [String]()
    
    // MARK: - UIControls
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblMessege: UILabel!
    @IBOutlet weak var tblViewMesseges: UITableView!
    
    // MARK: - ViewCOntroller Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblMessege.layer.cornerRadius = lblNotification.frame.size.height/2
        lblMessege.layer.masksToBounds = true
        
        lblNotification.layer.cornerRadius = lblMessege.frame.size.height/2
        lblNotification.layer.borderWidth = 1.0
        lblNotification.layer.borderColor = UIColor.lightGray.cgColor
        lblNotification.layer.masksToBounds = true
        
        arrImg = ["chef-img","chef-img","chef-img","chef-img"]
        arrName = ["Royal Parvej","Nijum Doe","Selim Vuia","Tanvir Pathan"]
        arrCmnt = ["Sounds Awesome!","My Order is ready or not?","Sounds Awesome!","How is Going?"]
    }
    
    // MARK: - Delegate Methods
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessegeVCCell") as! MessegeVCCell
        
        cell.imgProfile.image = UIImage(named: arrImg[indexPath.row])
        cell.lblName.text = arrName[indexPath.row]
        cell.lblCmnt.text = arrCmnt[indexPath.row]
        cell.lblNum.layer.cornerRadius = cell.lblNum.frame.size.height/2
        cell.lblNum.layer.masksToBounds = true
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.size.height/2
        cell.imgProfile.layer.masksToBounds = true
        cell.cellView.layer.cornerRadius = 15.0
        
        return cell
    }

    @IBAction func onClickNotification(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
  
}
