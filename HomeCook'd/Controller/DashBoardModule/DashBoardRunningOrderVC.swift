//
//  DashBoardRunningOrderVC.swift
//

import UIKit
import Alamofire
import SDWebImage

class DashBoardRunningOrderVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK:- Variables
    var dicRunningOrder  = RunningOrderModule()
    var bottomPadding: CGFloat = 50.0
    var arrRunningOrder = [RunningOrderSubModule]()
    
    
    // MARK:- UIControls
    @IBOutlet weak var tblViewRunningOrder: UITableView!
    @IBOutlet weak var lblRunningOrderCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblRunningOrderCount.text = ""
        self.tblViewRunningOrder.estimatedRowHeight = 154
        self.tblViewRunningOrder.rowHeight = UITableView.automaticDimension
        callApi()
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRunningOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardRunningOrderVCCell") as! DashBoardRunningOrderVCCell
            cell.lblFoodName.text = self.arrRunningOrder[indexPath.row].chefName
//        cell.imgFood.image = UIImage(named: arrFood[indexPath.row])
        cell.btnDone.layer.cornerRadius = cell.btnDone.frame.size.height/2
        cell.btnDone.layer.borderWidth = 1
        cell.btnDone.layer.borderColor = UIColor.clear.cgColor
        cell.lblInvoice.text = "\(self.arrRunningOrder[indexPath.row].orderId ?? 0)"
        cell.lblFoodType.text = "Breakfast"
        cell.lblFoodPrice.text = "$\(self.arrRunningOrder[indexPath.row].orderValue ?? 0.00)"
        cell.btnDone.tag = indexPath.row
        cell.btnCancel.tag = indexPath.row
        cell.btnDone.addTarget(self, action: #selector(btnDoneTapped), for: .touchUpInside)
        cell.btnCancel.addTarget(self, action: #selector(btnCancelTapped), for: .touchUpInside)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func btnDoneTapped(_ sender: UIButton){
        self.ApiChangeOrderStatus(orderstatus:"done", index:sender.tag, orderId: self.arrRunningOrder[sender.tag].orderId ?? 0)
    }
    
    @objc func btnCancelTapped(_ sender: UIButton){
        self.ApiChangeOrderStatus(orderstatus:"cancel", index:sender.tag, orderId: self.arrRunningOrder[sender.tag].orderId ?? 0)
    }

    
    //MARK:- Api Call
    func callApi() {
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        let apiUrl = ApiList.URL.Host  + ApiList.URL.OrderList.orderReqList
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
    
        let param = ["api_token":strToken ?? "","order_type": "runing_order"]
        let header:HTTPHeaders = ["Content-Type":"application/json"]

        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                    
                        weakSelf.dicRunningOrder = RunningOrderModule().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dicRunningOrder.status == true {
                          
                            weakSelf.arrRunningOrder = weakSelf.dicRunningOrder.arrRunningOrder
                            print("ArrCount :\(weakSelf.arrRunningOrder.count)")
                            DispatchQueue.main.async {
                                weakSelf.lblRunningOrderCount.text = "\(weakSelf.dicRunningOrder.datacount) Running Orders"

                                self?.tblViewRunningOrder.reloadData()
                            }
                        }
                        else {
                            Utils.showMessage(type: .error, message: dicResponseData["errMsg"]?.string ?? "")
                        }
                    } else {
                        Utils.showMessage(type: .error, message: "Something went wrong!")
                    }

                } else {
                }
                
            }
            }
    }
    
    
    func ApiChangeOrderStatus(orderstatus:String,index:Int,orderId:Int){
        
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        let apiUrl = ApiList.URL.Host  + ApiList.URL.OrderList.orderReqStatus
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? "","order_id":"\(orderId)" ,"order_status": orderstatus]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        
        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                        
                        if dicResponseData["status"]?.boolValue == true {
                            weakSelf.arrRunningOrder.remove(at: index)
                            weakSelf.lblRunningOrderCount.text = "\(weakSelf.arrRunningOrder.count) Running Orders"
                            DispatchQueue.main.async {
                                self?.tblViewRunningOrder.reloadData()
                            }
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

