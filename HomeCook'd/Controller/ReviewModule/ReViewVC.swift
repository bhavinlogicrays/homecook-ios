//
//  ReViewVC.swift
//

import UIKit
import Alamofire
import SDWebImage

class ReViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK:- Variables
    var arrReview = [ReviewResdict]()
    var dictRes = ReviewListResModule()
    
    // MARK:- UIControls
    @IBOutlet weak var tblViewReView: UITableView!
    @IBOutlet weak var lblTotalReview: UILabel!
    @IBOutlet weak var lblRating: UILabel!

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblViewReView.estimatedRowHeight = 180
        tblViewReView.rowHeight = UITableView.automaticDimension
        callApi()
    }
 
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrReview.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ReViewVCCell") as! ReViewVCCell
        
        cell.lblDate.text = arrReview[indexPath.row].reviewDate
//        cell.imageView?.sd_setImage(with: URL(string: arrReview[indexPath.row].image), placeholderImage: UIImage(named: "Ellipse 48"))
        cell.lblComment.text = "\(arrReview[indexPath.row].orderId ?? 0)" 
        cell.lblDescr.text = arrReview[indexPath.row].comment
        cell.cellView.layer.cornerRadius = 6
        cell.cellView.layer.borderWidth = 1
        cell.cellView.layer.borderColor = UIColor.clear.cgColor
        return cell
    }
    
    //MARK:- callApi
    
    func callApi() {
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        let apiUrl = ApiList.URL.Host  + ApiList.URL.Review.reviewList
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
                        weakSelf.dictRes =
                        ReviewListResModule().initWithDictionary(dictionary: dicResponseData)
                        weakSelf.arrReview = weakSelf.dictRes.dictRes.arrReviews
                        weakSelf.lblTotalReview.text =  "Total \(weakSelf.dictRes.dictRes.dictreviewCount.ratingCount ?? 0) Reviews"
                        weakSelf.lblRating.text  = "\(weakSelf.dictRes.dictRes.dictreviewCount.ratingAverage)"
                        DispatchQueue.main.async {
                            weakSelf.tblViewReView.reloadData()
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

