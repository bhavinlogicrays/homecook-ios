//
//  RevenueVC.swift
//

import UIKit

class RevenueVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK:- Variables
    var arrFood = [String]()
    var arrTitle = NSArray()
    private let numEntry = 20
    
    // MARK:- UIControls
    @IBOutlet weak var viewRevenue: UIView!
    @IBOutlet weak var viewDaily: UIView!
    @IBOutlet weak var tblViewRevenue: UITableView!
    @IBOutlet weak var basicBarChart: BasicBarChart!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        
        arrFood = ["Thai veg food","Thai veg food","Thai veg food","Thai veg food","Thai veg food"]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dataEntries = generateEmptyDataEntries()
        basicBarChart.updateDataEntries(dataEntries: dataEntries as! [DataEntry], animated: false)
        
        //        basicBarChart.setDataEntries(values: [1,2,3,4,5,6])
        if #available(iOS 10.0, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {[unowned self] (timer) in
                let dataEntries = self.generateRandomDataEntries()
                
                self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
        //        timer.fire()
    }
    
    // MARK: - UI Methods
   // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "RevenueVCCell") as! RevenueVCCell
        
         cell.imgFood.image = UIImage(named: arrFood[indexPath.row])
         cell.lblFoodName.text = "Vegetable Thai Food"
         cell.lblSale.text = "8 Sale"
         cell.lblFoodType.text = "Breakfast"
        return cell
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
}

