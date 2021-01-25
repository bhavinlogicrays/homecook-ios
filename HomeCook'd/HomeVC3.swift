//
//  HomeVC3.swift
//

import UIKit

class HomeVC3: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
   
    
    // MARK: - Variables
    var arrFoodImg = [String]()
    var arrFoodName = [String]()
    var arrFoodPrice = [String]()
    var arrFoodCat =   [[String:AnyObject]]()

    
    // MARK: - UIControls
    @IBOutlet weak var collectionViewFoodImg: UICollectionView!
    @IBOutlet weak var collectionViewItems: UICollectionView!
    @IBOutlet weak var collViewFoodCat: UICollectionView!

    @IBOutlet weak var btnbreakfast: UIButton!
    @IBOutlet weak var btnLunch: UIButton!
    @IBOutlet weak var btnDinner: UIButton!
    @IBOutlet weak var btnDrink: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnViewCart: UIButton!
    @IBOutlet weak var viewCart: UIView!
    @IBOutlet weak var conCollFoodItemHeight: NSLayoutConstraint!

    
//    @IBOutlet weak var collectionViewImages: UICollectionView!

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewCart.layer.cornerRadius = 10
//
//        imgChef.layer.cornerRadius = imgFood.frame.size.height/2
//        imgChef.layer.masksToBounds = true
//
//        lblTime.layer.cornerRadius = lblTime.frame.size.height/2
//        lblTime.layer.masksToBounds = true
//
       // DELEGATE.setCorner(button:btnViewCart )
        
        
    
         arrFoodImg = ["item-food-1","item-food-2","item-food-3","item-food-4"]
         arrFoodName = ["Thai veg food","veg thai","vegan thai curry","veganPad"]
        arrFoodCat = [["catName":"Brakfast","isSel":"1"],["catName":"Lunch","isSel":"0"],["catName":"Dinner","isSel":"0"],["catName":"Drink","isSel":"0"]] as [[String:AnyObject]]

    }
    
    func setBtnCorner(button: UIButton) {
        button.layer.cornerRadius = button.frame.size.height/2
        button.layer.masksToBounds = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFoodImg {
            return 1
        }
        else if collectionView == collViewFoodCat {
            return arrFoodCat.count
        }
        return arrFoodImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewFoodImg {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collImages", for: indexPath) as! collImages
            
//            cell.delegate = self
            cell.layer.cornerRadius = 8
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.lblDelTime.layer.cornerRadius = cell.lblDelTime.frame.size.height/2
            return cell
        }
        else if collectionView == collViewFoodCat {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collHomeDetailCell", for: indexPath) as! collHomeDetailCell
            cell.lblCaName.text = arrFoodCat[indexPath.row]["catName"] as? String ?? ""
            if arrFoodCat[indexPath.row]["isSel"] as? String == "1" {
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
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVC3Cell", for: indexPath) as! HomeVC3Cell
        if indexPath.row == 1 {
            cell.viewItemCount.isHidden = false
        }
        else {
            cell.viewItemCount.isHidden = true

        }
        cell.viewItemCount.layer.cornerRadius = cell.viewItemCount.frame.size.width/2
        cell.imgFood.image = UIImage(named: arrFoodImg[indexPath.row])
        cell.imgFood.layer.cornerRadius = 20.0
        conCollFoodItemHeight.constant = CGFloat((arrFoodImg.count / 2) * 159)
        collectionViewItems.updateConstraintsIfNeeded()
        collectionViewItems.layoutIfNeeded()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewFoodImg {
            return CGSize(width: self.collectionViewFoodImg.frame.size.width, height: self.collectionViewFoodImg.frame.size.height)
        }
        if collectionView == collViewFoodCat {
            return CGSize(width:(self.view.frame.size.width / 4  )    , height: (self.collViewFoodCat.frame.size.height ))

        }

        return CGSize(width:(self.collectionViewItems.frame.size.width / 2  ) - 20   , height: (self.collectionViewItems.frame.size.width / 2) - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collViewFoodCat
        {
            for i in 0..<arrFoodCat.count {
                var dict = arrFoodCat[i]
                if dict["isSel"] as? String == "1" {
                    dict["isSel"] = "0" as AnyObject
                    arrFoodCat[i] = dict
                }
            }
            var dictMain = arrFoodCat[indexPath.row]
            dictMain["isSel"] = "1" as AnyObject
            arrFoodCat[indexPath.row] = dictMain
            self.collViewFoodCat.reloadData()
            
        }
        
        else if collectionView == collectionViewItems {
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
            self.navigationController?.pushViewController(objVC, animated: true)

        }
    }
    
    // MARK: -  Action
    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnReviewClick(_ sender:AnyObject) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "ReViewVC") as! ReViewVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    
    
    
    
}
