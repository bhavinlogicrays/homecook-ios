//
//  DashBoardVC.swift
//

import UIKit

class DashBoardVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,DashBoardVCCellDelegate{
   
    
    // MARK:- Variables
    var arrFood = [String]()
    var arrTitle = NSArray()
    private let numEntry = 20

    // MARK:- UIControls
    @IBOutlet weak var runningOrders: UIView!
    @IBOutlet weak var orderRequest: UIView!
    @IBOutlet weak var viewRevenue: UIView!
    @IBOutlet weak var viewTimeByChart: UIView!
    @IBOutlet weak var viewDaily: UIView!
    @IBOutlet weak var viewReviews: UIView!
    @IBOutlet weak var viewItems: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
     @IBOutlet weak var basicBarChart: BasicBarChart!
    
    var txtTemp: UITextField!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
        
        arrFood = ["dash-img-2","dash-img-1","dash-img-1","dash-img-2"]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dataEntries = generateEmptyDataEntries()
        basicBarChart.updateDataEntries(dataEntries: dataEntries as! [DataEntry], animated: false)
      
        //        basicBarChart.setDataEntries(values: [1,2,3,4,5,6])
        if #available(iOS 10.0, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) {[unowned self] (timer) in
                let dataEntries = self.generateRandomDataEntries()
                
                self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
        //        timer.fire()
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
    }
    
    func setViewCorRad(view: UIView) {
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.clipsToBounds = false
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
        for i in 0..<numEntry {
            let value = (arc4random() % 90) + 10
            
            let height: Float = Float(value) / 100.0
            
            result.append(DataEntry(color: colors, height: height, textValue: "\(value)%", title: "\(i+01)AM" ))
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
        objVC.delegate = self as? DashBoardRunningOrderVCDelegate
//        objVC.popupDelegate = self
        self.present(objVC, animated: true, completion: nil)
    }
    
    @IBAction func onClickOrderRequest(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "DashBoardOrderRequestVC") as! DashBoardOrderRequestVC
        objVC.delegate = self as? DashBoardRunningOrderVCDelegate as? DashBoardOrderRequestVCDelegate
        //        objVC.popupDelegate = self
        self.present(objVC, animated: true, completion: nil)
    }
    
    // MARK: - Delegate Methods
    // MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardVCCell", for: indexPath) as! DashBoardVCCell
        
        cell.delegate = self
        cell.row = indexPath.row
        cell.imageView.image = UIImage(named: arrFood[indexPath.row])
        cell.imageView.layer.cornerRadius = 20.0
        cell.imageView.layer.masksToBounds = true
        cell.imageView.layer.borderWidth = 1.0
        cell.imageView.layer.borderColor = UIColor.white.cgColor
        cell.lblSale.text = "15 Sale"
        cell.lblFoodType.text = "Breakfast"
        cell.lblFoodName.text = "Vegetable Thai Food"
        cell.lblFoodPrice.text = "$50"
        
        return cell
    }
    
    // MARK: - DashBoardVCCell
    func didPressOnCell(_ Index: Int) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MyFoodDetailVC") as! MyFoodDetailVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
}

