//
//  DashBoardVC.swift
//

import UIKit
import Alamofire
import SDWebImage

class DashBoardVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    
    // MARK:- Variables
    private let numEntry = 20

    // MARK:- UIControls
    @IBOutlet weak var runningOrders: UIView!
    @IBOutlet weak var orderRequest: UIView!
    @IBOutlet weak var viewRevenue: UIView!
    @IBOutlet weak var viewTimeByChart: UIView!
    @IBOutlet weak var viewDaily: UIView!
    @IBOutlet weak var viewReviews: UIView!
    @IBOutlet weak var viewItems: UIView!
    @IBOutlet weak var collPopularItems: UICollectionView!
     @IBOutlet weak var basicBarChart: BasicBarChart!
    @IBOutlet weak var lblTotalReviews: UILabel!
    @IBOutlet weak var lblReviewsCount: UILabel!
    @IBOutlet weak var lblRunnningOrderCount: UILabel!
    @IBOutlet weak var lblOrderReqCount: UILabel!
    @IBOutlet weak var lblRevenueCount: UILabel!

    var txtTemp: UITextField!
    var dictDashboard = DashboardResponse()
    var arrPopularItems  = [Dashboard_PopularItem]()
    var arrRevenueList  = [Dashboard_Revenue]()

    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        callApi()

    }

    override func viewDidAppear(_ animated: Bool) {
    }
    
    // MARK: - UI Methods
    func setUI(){
        
        CommonManager.setViewCorner(view: runningOrders)
        CommonManager.setViewCorner(view: orderRequest)
       
        viewRevenue.layer.cornerRadius = 25.0
        viewRevenue.layer.masksToBounds = true
        
        setViewCorRad(view: viewReviews)
        setViewCorRad(view: viewItems)
        
        viewTimeByChart.layer.cornerRadius = 25.0
        viewTimeByChart.layer.borderWidth = 2.0
        viewTimeByChart.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0) .cgColor
        viewTimeByChart.layer.masksToBounds = true
        viewTimeByChart.clipsToBounds = false

        viewDaily.layer.cornerRadius = 10.0
        viewDaily.layer.borderWidth = 2.0
        viewDaily.layer.borderColor = UIColor.init(red: 232.0/255.0, green: 234.0/255.0, blue: 237.0/255.0, alpha: 1.0) .cgColor
        viewDaily.layer.masksToBounds = true
        viewDaily.clipsToBounds = false
        
        
        self.lblTotalReviews.text = ""
        self.lblReviewsCount.text = ""
        self.lblRevenueCount.text = ""
        self.lblOrderReqCount.text = ""
        self.lblRunnningOrderCount.text = ""

        
    }
    
    func setViewCorRad(view: UIView) {
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.clipsToBounds = false
    }
    
    
    func generateRandomDataEntries() -> [DataEntry] {
        
        let colors = UIColor.init(red: 254.0/255.0, green: 235.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        var result: [DataEntry] = []
        arrRevenueList.forEach { (dict) in
            let value = dict.revenue ?? 0
            let height: Float = Float(value) / 100.0
            result.append(DataEntry(color: colors, height: height, textValue: "\(value)%", title: dict.addedDate ))
        }
        return result
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickSeedetail(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "RevenueVC") as! RevenueVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickChart(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "RevenueVC") as! RevenueVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickReviews(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "ReViewVC") as! ReViewVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickRunningOrders(_ sender: UIButton) {
        
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "DashBoardRunningOrderVC") as! DashBoardRunningOrderVC
        self.present(objVC, animated: true, completion: nil)
    }
    
    @IBAction func onClickOrderRequest(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "DashBoardOrderRequestVC") as! DashBoardOrderRequestVC
        self.present(objVC, animated: true, completion: nil)
    }
    
    // MARK: - Delegate Methods
    // MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPopularItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardVCCell", for: indexPath) as! DashBoardVCCell
        cell.imageView.layer.cornerRadius = 20.0
        cell.imageView.layer.borderWidth = 1.0
        cell.imageView.layer.borderColor = UIColor.white.cgColor
        cell.imageView.sd_setImage(with: URL(string:arrPopularItems[indexPath.row].itemImage), placeholderImage: UIImage(named: "vegan thai curry"))
        cell.lblSale.text = ("\(arrPopularItems[indexPath.row].saleCount) sale")
        cell.lblFoodName.text = (arrPopularItems[indexPath.row].itemName)
        cell.lblFoodPrice.text = "$\((arrPopularItems[indexPath.row].itemPrice) ?? 0.00)"
        cell.lblFoodType.text = "Breakfast"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = STORYBOARD.instantiateViewController(withIdentifier: "MyFoodDetailVC") as! MyFoodDetailVC
        nextVC.passitemid = arrPopularItems[indexPath.row].itemId
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collPopularItems.frame.size.width / 2  , height: self.collPopularItems.frame.size.width / 2)
    }
    
    
    //MARK:- Api Call
    
    func callApi() {
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Dashboard.dashboardView
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? ""]
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
                        weakSelf.dictDashboard =
                        DashboardResponse().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dictDashboard.status == true {
                            weakSelf.arrPopularItems = weakSelf.dictDashboard.dictData.popular_items
                            DispatchQueue.main.async {
                                weakSelf.lblOrderReqCount.text = "\(weakSelf.dictDashboard.dictData.total_requested_order ?? 0)"
                                weakSelf.lblRunnningOrderCount.text = "\(weakSelf.dictDashboard.dictData.total_runing_order ?? 0)"
                                weakSelf.arrRevenueList = weakSelf.dictDashboard.dictData.revenue_list
                                weakSelf.lblRevenueCount.text = " $ \(weakSelf.dictDashboard.dictData.total_revenue)"
                                weakSelf.lblReviewsCount.text = "\(weakSelf.dictDashboard.dictData.reviews.ratingAverage)"
                                weakSelf.lblTotalReviews.text = "Total \(weakSelf.dictDashboard.dictData.reviews.ratingCount ?? 0 ) Reviews"
                                weakSelf.collPopularItems.reloadData()
                                    if #available(iOS 10.0, *) {
                                        _ = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) { (timer) in
                                            let dataEntries = weakSelf.generateRandomDataEntries()
                                            weakSelf.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
                                        }
                                    } else {
                                    }
                            }

                        }
                        else {
                            Utils.showMessage(type: .error, message: "Something went wrong!")
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

