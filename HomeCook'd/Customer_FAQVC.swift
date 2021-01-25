//
//  Customer_FAQVC.swift
//

import UIKit

class Customer_FAQVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblCustomerFaq:UITableView!
    @IBOutlet weak var btnBack:UIButton!

    var arrData = [[String:Any]]()
    var isSelected:Bool = false
    var selectedIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        arrData = [["title":"this is a title","desc":"this is a description.this is a description.this is a description.this is a description.","isTapp":"1"],["title":"this is a title","desc":"this is a description.this is a description.this is a description.this is a description.","isTapp":"0"],["title":"this is a title","desc":"this is a description.this is a description.this is a description.this is a description.","isTapp":"0"],["title":"this is a title","desc":"this is a description.this is a description.this is a description.this is a description.","isTapp":"0"],["title":"this is a title","desc":"this is a description.this is a description.this is a description.this is a description.","isTapp":"0"]]
       
    }
    
//MARK:- UITableview Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCustomerFaq.dequeueReusableCell(withIdentifier: "CustomFaqtblCell", for: indexPath) as! CustomFaqtblCell
        if  arrData[indexPath.row]["isTapp"] as? String == "1" {
            cell.lblHeader.textColor = UIColor.white
            cell.lblDetail.textColor = UIColor.white
            cell.viewBorder.backgroundColor = UIColor.black
            cell.imgDopDown.image = #imageLiteral(resourceName: "Arrow")
        }
        else {
            cell.lblHeader.textColor = UIColor.black
            cell.viewBorder.backgroundColor = UIColor.init(hexString: "#F6F6F6")
            cell.imgDopDown.image = UIImage(named: "arrow-black")
        }
            cell.lblHeader.text = arrData[indexPath.row]["title"] as? String ?? ""
        cell.lblDetail.text = arrData[indexPath.row]["desc"] as? String ?? ""
        cell.viewBorder.layer.cornerRadius = 8
        cell.viewBorder.layer.borderWidth = 1
        cell.viewBorder.layer.borderColor = UIColor.clear.cgColor

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dict = arrData[indexPath.row]
        if dict["isTapp"] as? String == "1" {
            return 130
        } else {
            return 60
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        for i in 0..<arrData.count {
            var dict = arrData[i]
            if dict["isTapp"] as? String == "1" {
                dict["isTapp"] = "0"
                arrData[i] = dict
            }
        }
        var dictMain = arrData[selectedIndex]
        dictMain["isTapp"] = "1"
        arrData[selectedIndex] = dictMain
        
        self.tblCustomerFaq.reloadData()
    }
    //MARK:- Action Method
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


   
}
