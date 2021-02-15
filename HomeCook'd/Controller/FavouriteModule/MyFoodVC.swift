//
//  MyFoodVC.swift
//  

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

enum FoodType:String  {
    case Breakfast = "breakfast"
    case All = ""
    case Dinner = "dinner"
    case Lunch = "lunch"
}



class MyFoodVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // MARK:- Variables

    var arrFoodList = [FoodListResponse]()
    var dicFoodRes  = MyFood_Res()
    var arrFoodCat =   [JSON]()
    var arrCat =   [[String:Any]]()
    var strSelValue:String = ""
    
    // MARK:- UIControls
    @IBOutlet weak var tblViewMyFood: UITableView!
    @IBOutlet weak var collCat: UICollectionView!

    @IBOutlet weak var lblTotalItem: UILabel!

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTotalItem.text = ""
        callApi()
    }
    
    
    // MARK: - Delegate Methods
    
    // MARK:- UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFoodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFoodVCCell") as! MyFoodVCCell
        cell.lblFoodName.text = arrFoodList[indexPath.row].itemName
        cell.imgFood.sd_setImage(with: URL(string: arrFoodList[indexPath.row].itemImage), placeholderImage: UIImage(named: "vegan thai curry"))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MyFoodDetailVC") as! MyFoodDetailVC
        objVC.passitemid = arrFoodList[indexPath.row].itemId
        self.navigationController?.pushViewController(objVC, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let strDesc = arrFoodList[indexPath.row].itemName as String
        let heightDesc = strDesc.height(withConstrainedWidth:tableView.frame.size.width - 155.0, font:UIFont.getAppFont(of: .medium, size: 16)) + 10 as CGFloat
        if heightDesc < 70 {
            return 130
        }
        else {
            return 130 + heightDesc

        }
    }
    
  
    // MARK:-  Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFoodCat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collHomeDetailCell", for: indexPath) as! collHomeDetailCell
        cell.lblCaName.text = arrCat[indexPath.row]["title"] as? String ?? ""

        if arrCat[indexPath.row]["is_Sel"] as? String == "1" {
            cell.contentView.backgroundColor = UIColor.init(hexString: "#FB6D3A")
            cell.lblCaName.textColor = UIColor.init(hexString: "#FFFFFF")
        }
        else
        {
            cell.contentView.backgroundColor = UIColor.init(hexString: "#E8EAED")
            cell.lblCaName.textColor = UIColor.init(hexString: "#333333")

        }
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = arrFoodCat[indexPath.row].stringValue.size(withAttributes: [NSAttributedString.Key.font: UIFont.getAppFont(of: .normal, size: 13)])
        size.width =  size.width + 60
        return CGSize(width:max(40,size.width),height:self.collCat.frame.size.height)

//        return CGSize(width:((self.collCat.frame.size.width - 30) / CGFloat(self.arrCat.count)), height: (self.collCat.frame.size.height ))

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for i in 0..<arrCat.count {
            var dict = arrCat[i]
            if dict["is_Sel"] as? String  == "1" {
                dict["is_Sel"] = "0"
                arrCat[i]  = dict
            }
        }
        
        var dictMain = arrCat[indexPath.row]
        dictMain["is_Sel"] = "1" as AnyObject
        arrCat[indexPath.row] = dictMain
        strSelValue = (dictMain["title"] as? String)?.lowercased() ?? ""
        self.callApi()
        
    }

    
    //MARK:- Api Call
    
    func callApi() {
        let apiUrl = ApiList.URL.Host  + ApiList.URL.FoodList.myfoodList
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? "","food_type":strSelValue] as [String : Any]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()
        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                        weakSelf.dicFoodRes =
                        MyFood_Res().initWithDictionary(dictionary: dicResponseData)
                        weakSelf.arrFoodList = weakSelf.dicFoodRes.arrFoodRes
                        weakSelf.arrFoodCat = weakSelf.dicFoodRes.arrFoodCat
                        if weakSelf.arrCat.count == 0 {
                            for i in 0..<weakSelf.arrFoodCat.count {
                                
                                let strVal = weakSelf.arrFoodCat[i].stringValue
                                var dict = [String:Any]()
                                dict["title"] =  strVal
                                if i == 0 {
                                    dict["is_Sel"] =  "1"
                                    weakSelf.strSelValue = (dict["title"] as! String).lowercased()
                                    weakSelf.callApi()
                                }
                                else {
                                    dict["is_Sel"] =  "0"

                                }
                                weakSelf.arrCat.append(dict)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            
                            weakSelf.lblTotalItem.text = "Total \(weakSelf.dicFoodRes.arrFoodRes.count) items"
                            weakSelf.collCat.reloadData()
                            weakSelf.tblViewMyFood.reloadData()
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

