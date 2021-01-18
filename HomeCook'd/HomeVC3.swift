//
//  HomeVC3.swift
//

import UIKit

class HomeVC3: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    // MARK: - Variables
    var arrFoodImg = [String]()
    var arrFoodName = [String]()
    var arrFoodPrice = [String]()
    
    
    // MARK: - UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgChef: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnBreakFast: UIButton!
    @IBOutlet weak var btnLunch: UIButton!
    @IBOutlet weak var btnDinner: UIButton!
    @IBOutlet weak var btnDrink: UIButton!
    @IBOutlet weak var collectionViewItems: UICollectionView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgFood.layer.cornerRadius = 30.0
        imgFood.layer.masksToBounds = true
        
        imgChef.layer.cornerRadius = imgFood.frame.size.height/2
        imgChef.layer.masksToBounds = true
        
        lblTime.layer.cornerRadius = lblTime.frame.size.height/2
        lblTime.layer.masksToBounds = true
        
        setBtnCorner(button: btnBreakFast)
        setBtnCorner(button: btnLunch)
        setBtnCorner(button: btnDinner)
        setBtnCorner(button: btnDrink)
        
         arrFoodImg = ["Thai veg food","veg thai","vegan thai curry","veganPad","vegetable pad thai","vegetarian thai food","vegetarian thai"]
        arrFoodName = ["Thai veg food","veg thai","vegan thai curry","veganPad","vegetable pad thai","vegetarian thai food","vegetarian thai"]
        
    }
    
    func setBtnCorner(button: UIButton) {
        button.layer.cornerRadius = lblTime.frame.size.height/2
        button.layer.masksToBounds = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFoodImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVC3Cell", for: indexPath) as! HomeVC3Cell
        
        cell.imgFood.image = UIImage(named: arrFoodImg[indexPath.row])
        cell.imgFood.layer.cornerRadius = 20.0
        cell.imgFood.layer.masksToBounds = true
        
        return cell
    }
   
}
