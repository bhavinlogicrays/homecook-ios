//
//  MyFoodVC.swift
//  

import UIKit

class MyFoodVC: UIViewController,UITableViewDataSource,UITableViewDelegate,MyFoodVCCellDelegate {
    
    // MARK:- Variables
    var arrFood = [String]()
    
    // MARK:- UIControls
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnBreakfast: UIButton!
    @IBOutlet weak var btnLunch: UIButton!
    @IBOutlet weak var btnDinner: UIButton!
    @IBOutlet weak var tblViewMyFood: UITableView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBtnCor(button: btnAll)
        setBtnCor(button: btnBreakfast)
        setBtnCor(button: btnLunch)
        setBtnCor(button: btnDinner)
        
        
         arrFood = ["Thai veg food","veg thai","vegan thai curry","veganPad","vegetable pad thai","vegetarian thai food","vegetarian thai"]
    }
    
    // MARK: UI Methods
    func setBtnCor(button: UIButton) {
        button.layer.cornerRadius = btnLunch.frame.size.height/2
        button.layer.masksToBounds = true
    }
    
    // MARK: - Delegate Methods
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFoodVCCell") as! MyFoodVCCell
        
        cell.delegate = self
        cell.row = indexPath.row
        cell.imgFood.image = UIImage(named: arrFood[indexPath.row])
        return cell
    }

    func didPressOnCell(_ Index: Int) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MyFoodDetailVC") as! MyFoodDetailVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
}

