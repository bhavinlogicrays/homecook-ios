//
//  RevenueVC.swift
//

import UIKit
import Alamofire

class RevenueVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK:- Variables

    var arrItemList = [Revenue_ItemList]()
    var arrRevenueList = [Dashboard_Revenue]()
    
    var dictData = RevenueList()
    
    let numEntry = 20
    // MARK:- UIControls
    @IBOutlet weak var viewRevenue: UIView!
    @IBOutlet weak var viewDaily: UIView!
    @IBOutlet weak var tblViewRevenue: UITableView!
    @IBOutlet weak var basicBarChart: BasicBarChart!
    @IBOutlet weak var lblRevenueCount: UILabel!

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewRevenue.estimatedRowHeight  = 90
        self.tblViewRevenue.rowHeight = UITableView.automaticDimension
        setUI()
    }
    
    func setUI() {
        viewRevenue.layer.cornerRadius = 25.0
        viewRevenue.layer.borderWidth = 2.0
        viewRevenue.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0) .cgColor
        viewRevenue.layer.masksToBounds = true
        viewRevenue.clipsToBounds = false
       
        viewDaily.layer.cornerRadius = 10.0
        viewDaily.layer.borderWidth = 2.0
        viewDaily.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0) .cgColor
        viewDaily.layer.masksToBounds = true
        viewDaily.clipsToBounds = false
        
        lblRevenueCount.text = ""
        callApi()

    }
    
    
    // MARK: - UI Methods
   // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "RevenueVCCell") as! RevenueVCCell
//        cell.imgFood.sd_setImage(with: URL(string:arrItemList[indexPath.row].itemImage), placeholderImage: UIImage(named: "Rectangle 32"))
            cell.lblFoodName.text = arrItemList[indexPath.row].itemName
        cell.lblFoodType.text = arrItemList[indexPath.row].catname
        cell.lblSale.text = "\(arrItemList[indexPath.row].saleCount ?? 0) Sale"
//         cell.lblFoodType.text = "Breakfast"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let strDesc = arrItemList[indexPath.row].itemName as String
        let heightDesc = strDesc.height(withConstrainedWidth:tableView.frame.size.width - 100.0, font:UIFont.getAppFont(of: .medium, size: 15)) + 40 as CGFloat
        if heightDesc < 70 {
            return 120
        }
        else {
            return 120 + heightDesc

        }

        //return UITableView.automaticDimension
    }
    
    func generateEmptyDataEntries() -> [DataEntry?] {
        var result: [DataEntry] = []
        Array(0..<numEntry).forEach {_ in
            result.append(DataEntry(color: UIColor.clear, height: 0, textValue: "0", title: ""))
        }
        return result
    }
    
    func generateRandomDataEntries() -> [DataEntry] {
        
        let colors = UIColor.init(red: 254.0/255.0, green: 235.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        var result: [DataEntry] = []
        arrRevenueList.forEach { (dict) in
            let value = dict.revenue ?? 0
            let height: Float = Float(value) / 100.0
            result.append(DataEntry(color: colors, height: height, textValue: "\(value)%", title: dict.addedDate))
        }
        return result
    }
    
    //MARK:- Api Call
    func callApi() {
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Revenue.revenueList
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? ""]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        Utils.showProgressHud()
        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                        weakSelf.dictData =
                        RevenueList().initWithDictionary(dictionary: dicResponseData)
                        weakSelf.arrItemList = weakSelf.dictData.dictData.arrItemList
                        weakSelf.arrRevenueList = weakSelf.dictData.dictData.arrRev
                        weakSelf.lblRevenueCount.text =  "$ \(weakSelf.dictData.dictData.totalReven)"
                        DispatchQueue.main.async {
                            weakSelf.tblViewRevenue.reloadData()
                            if #available(iOS 10.0, *) {
                                _ = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) {(timer) in
                                    let dataEntries = weakSelf.generateRandomDataEntries()
                                    weakSelf.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
                                }
                            } else {
                            }

                        }
                    } else {
                        Utils.showMessage(type: .error, message: "Something went wrong!")
                    }

                } else {
                }
                
            }
            }
    }
}

