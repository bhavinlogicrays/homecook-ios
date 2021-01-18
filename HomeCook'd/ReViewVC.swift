//
//  ReViewVC.swift
//

import UIKit

class ReViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK:- Variables
    var arrProfile = [String]()
    var arrCmnt = [String]()
    var arrDescr = [String]()
    
    // MARK:- UIControls
    @IBOutlet weak var tblViewReView: UITableView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        arrProfile = ["Ellipse 48","chef-img","Ellipse 48"]
        arrCmnt = ["Great Food and Service","Awesome and nice","Awesome and nice"]
        arrDescr = ["This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks.","This Food so tasty and delicious.Breakfast so fast delivered in my place.","This Food so tasty and delicious.Breakfast so fast delivered in my place."]
    }
 
    // MARK: - UI Methods
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProfile.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let strDesc = arrDescr[indexPath.row] as String
        let heightDesc = strDesc.height(withConstrainedWidth:tableView.frame.size.width - 100.0, font:UIFont(name: "Poppins-Regular", size: 12.0)!) + 20.0 as CGFloat
        return 115.0 + heightDesc
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ReViewVCCell") as! ReViewVCCell
        
        cell.imgView.image = UIImage(named: arrProfile[indexPath.row])
        cell.lblDate.text = "20/12/2020"
        cell.lblComment.text = arrCmnt[indexPath.row]
        cell.lblDescr.text = arrDescr[indexPath.row]
        cell.cellView.layer.cornerRadius = 6
        cell.cellView.layer.masksToBounds = true
        
        return cell
    }
    
}

