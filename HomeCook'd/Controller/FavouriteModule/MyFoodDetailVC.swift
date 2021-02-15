//
//  MyFoodDetailVC.swift
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class MyFoodDetailVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // MARK:- Variables
    var dictMain = FoodDetailRes()
    var dictFoodDeatil  = FoodDetail_SubRes()
    var arrMainIng = [IngResponseSubModule]()
    var passitemid  = String()
    var arrFoodImages = [JSON]()
    var arrAlIng = [IngArryStore]()

    // MARK:- UIControls
//    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblbreakfast: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var collFoodImages: UICollectionView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var concollIngHeiht: NSLayoutConstraint!
    @IBOutlet weak var conDetailHeight: NSLayoutConstraint!
    @IBOutlet weak var lblitemName: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var pageControll: UIPageControl!


    
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblitemName.text = ""
        detailTextView.text = ""
//            imgFood.layer.cornerRadius = 15.0
//            imgFood.layer.masksToBounds = true
        setLblCor(label: lblbreakfast)
        setLblCor(label: lblTime)
        pageControll.currentPage  = 0
        
        callApi()
    }
    
    // MARK: - UI Methods
    func setLblCor(label: UILabel) {
        label.layer.cornerRadius = lblbreakfast.frame.size.height/2
        label.layer.masksToBounds = true
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnClickEdit(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "EditItemsVC") as! EditItemsVC
        objVC.dictResponsefromDetail = dictFoodDeatil
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collFoodImages {
            return arrFoodImages.count
        }
        return arrMainIng.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collFoodImages {
            let cell =  collFoodImages.dequeueReusableCell(withReuseIdentifier: "CellCollFoodImages", for: indexPath) as! CellCollFoodImages
            cell.imgFood.sd_setImage(with: URL(string: arrFoodImages[indexPath.row].stringValue),placeholderImage:UIImage(named: "veganPad"))
            return cell
        }
        
        let cell =  collectionViewIngradients.dequeueReusableCell(withReuseIdentifier: "EditItemVCCell", for: indexPath) as! EditItemVCCell
        cell.imgIngrs.sd_setImage(with: URL(string:arrMainIng[indexPath.row].ingImage), placeholderImage: UIImage(named: "onion"))
        cell.lblIngrName.text = arrMainIng[indexPath.row].ingName
        cell.lblIngrName2.text = ""
        concollIngHeiht.constant = CGFloat((arrMainIng.count / 5) * 100)
        self.collectionViewIngradients.layoutIfNeeded()
        self.collectionViewIngradients.updateConstraintsIfNeeded()
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collFoodImages {
            return CGSize(width: self.collFoodImages.frame.size.width , height: self.collFoodImages.frame.size.height)
        }
        return CGSize(width:self.collectionViewIngradients.frame.size.width / 5, height: 100)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collFoodImages {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControll.currentPage = Int(pageNumber)
        }
    }

    
    //MARK:- ApiCall
    func callApi(){
        let apiUrl = ApiList.URL.Host  + ApiList.URL.FoodList.foodDetail
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? "","item_id":passitemid] as [String : Any]
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
                        weakSelf.dictMain =
                        FoodDetailRes().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dictMain.status == true {
                            weakSelf.dictFoodDeatil  = weakSelf.dictMain.dictFoodDetail
//                            weakSelf.imgFood.sd_setImage(with: URL(string:weakSelf.dictFoodDeatil.itemImage),placeholderImage: UIImage(named: "vegan thai curry"))
                            
                            weakSelf.lblitemName.text = weakSelf.dictFoodDeatil.itemName
                            weakSelf.detailTextView.text = weakSelf.dictFoodDeatil.itemDesc
                            weakSelf.lblbreakfast.text = weakSelf.dictFoodDeatil.catName
                            if weakSelf.lblbreakfast.text == "" {
                                weakSelf.lblbreakfast.isHidden = true
                            }
                            else {
                                weakSelf.lblbreakfast.isHidden = false
                            }
                            weakSelf.lblprice.text = "$ \(weakSelf.dictFoodDeatil.itemPrice ?? 0.00)"
                            weakSelf.arrFoodImages = weakSelf.dictFoodDeatil.arrImages
                            weakSelf.arrAlIng =  weakSelf.dictFoodDeatil.arrAllIngRes
                            weakSelf.arrAlIng.forEach {(dict) in
                                weakSelf.arrMainIng.append(contentsOf: dict.arrIngList.filter{$0.isSelected ==  1})
                            }
                            print(weakSelf.arrMainIng.count)
                            if weakSelf.arrMainIng.count > 0 {
                                weakSelf.concollIngHeiht.constant = 20
                                weakSelf.collectionViewIngradients.layoutIfNeeded()
                                weakSelf.collectionViewIngradients.updateConstraintsIfNeeded()
                            }
                            else {
                                weakSelf.concollIngHeiht.constant = 10
                                weakSelf.collectionViewIngradients.layoutIfNeeded()
                                weakSelf.collectionViewIngradients.updateConstraintsIfNeeded()
                            }
                            weakSelf.pageControll.numberOfPages = weakSelf.arrFoodImages.count
                            weakSelf.collFoodImages.reloadData()
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
