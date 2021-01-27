//
//  AddressVC.swift
//

import UIKit

class AddressVC: UIViewController,UITableViewDataSource,UITableViewDelegate,AddressVCCellDelegate {
    
    // MARK: - Variables
    var arrImg = [[String:AnyObject]]  ()
    
    // MARK: - UIControls
    @IBOutlet weak var tblAdress: UITableView!
    @IBOutlet weak var btnAddNewAdd: UIButton!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DELEGATE.setCorner(button: btnAddNewAdd)
        
        arrImg = [["img":"home-ic","name":"Home","address":"2464 Royal Ln. Mesa, New Jersey 45463"],["img":"work-ic","name":"Work","address":"3891 Ranchview Dr. Richardson, California 62639"]] as [[String : AnyObject]]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressVCCell") as! AddressVCCell
        
        cell.delegate = self
        cell.imgView.image = UIImage(named: arrImg[indexPath.row]["img"] as! String)
        cell.lblName.text  = arrImg[indexPath.row]["name"] as? String ?? ""
        cell.lblAdrs.text  = arrImg[indexPath.row]["address"] as? String ??  ""
        cell.cellView.layer.cornerRadius = 20.0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
  
    func didPressOnCell(_ Index: Int) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC2") as! AddressVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    func didPressOnEdit(_ Index: Int) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC2") as! AddressVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAddNewAddClick(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC2") as! AddressVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UITextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtTemp = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtTemp.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtTemp.text = txtTemp.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        txtTemp.resignFirstResponder()
        txtTemp = nil
    } 

}
