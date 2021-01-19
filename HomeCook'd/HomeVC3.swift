//
//  HomeVC3.swift
//

import UIKit

class HomeVC3: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARK: - Variables
    var arrFoodImg = [String]()
    var arrFoodName = [String]()
    var arrFoodPrice = [String]()
    
    
    // MARK: - UIControls
    @IBOutlet weak var collectionViewFoodImg: UICollectionView!
    @IBOutlet weak var collectionViewItems: UICollectionView!
//    @IBOutlet weak var collectionViewImages: UICollectionView!

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        imgFood.layer.cornerRadius = 30.0
//        imgFood.layer.masksToBounds = true
//
//        imgChef.layer.cornerRadius = imgFood.frame.size.height/2
//        imgChef.layer.masksToBounds = true
//
//        lblTime.layer.cornerRadius = lblTime.frame.size.height/2
//        lblTime.layer.masksToBounds = true
//
//        setBtnCorner(button: btnBreakFast)
//        setBtnCorner(button: btnLunch)
//        setBtnCorner(button: btnDinner)
//        setBtnCorner(button: btnDrink)
        
         arrFoodImg = ["item-food-1","item-food-2","item-food-3","item-food-4"]
         arrFoodName = ["Thai veg food","veg thai","vegan thai curry","veganPad"]
        
    }
    
//    func setBtnCorner(button: UIButton) {
//        button.layer.cornerRadius = lblTime.frame.size.height/2
//        button.layer.masksToBounds = true
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFoodImg {
            return 1
        }
        return arrFoodImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFoodImg {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collImages", for: indexPath) as! collImages
            cell.layer.cornerRadius = 25.0
            return cell
        }

         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVC3Cell", for: indexPath) as! HomeVC3Cell
        cell.imgFood.image = UIImage(named: arrFoodImg[indexPath.row])
        cell.imgFood.layer.cornerRadius = 20.0
        cell.imgFood.layer.masksToBounds = true
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == collectionViewFoodImg {
//            return CGSize(width: self.collectionViewFoodImg.frame.size.width, height: self.collectionViewFoodImg.frame.size.height)
//        }
//        return CGSize(width:(self.view.frame.size.width - 20  ) / 2  , height: self.collectionViewItems.frame.size.width / 2)
//    }
}
