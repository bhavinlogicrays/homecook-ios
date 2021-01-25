//
//  Customer_OrderVC.swift
//

import UIKit

class Customer_OrderVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{
    
    
    
    // MARK: - Variables
    var arrImg = [String]()
    var arrFoodName = [String]()
    var arrFoodCat =   [[String:AnyObject]]()

    
    // MARK: - UIControls
    @IBOutlet weak var tblViewItems: UITableView!
    @IBOutlet weak var collViewFoodCat: UICollectionView!

   

    
//    @IBOutlet weak var collectionViewImages: UICollectionView!

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
        
        arrImg  = ["cart-img1","cart-img2","cart-img3","cart-img1"]
        arrFoodName = ["Vegetable Thai Food","Vegetable Thai Food","Keema Chickeniriyani","Mazali Chicken halim"]
         arrFoodCat = [["catName":"Running Orders(1)","isSel":"1"],["catName":"Past Orders","isSel":"0"],["catName":"Dinner","isSel":"0"],["catName":"Drink","isSel":"0"]] as [[String:AnyObject]]

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrFoodCat.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Customer_OrderVCCell", for: indexPath) as! Customer_OrderVCCell
                cell.lblCaName.text = arrFoodCat[indexPath.row]["catName"] as? String ?? ""
                if arrFoodCat[indexPath.row]["isSel"] as? String == "1" {
                    cell.contentView.backgroundColor = UIColor.init(hexString: "#FB6D3A")
                
                    cell.lblCaName.textColor = UIColor.init(hexString: "#FFFFFF")
                    cell.contentView.layer.borderColor = UIColor.clear.cgColor

                }
                else
                {
                    cell.contentView.backgroundColor = UIColor.init(hexString: "#E8EAED")
                    
                    cell.lblCaName.textColor = UIColor.init(hexString: "#333333")
                    cell.contentView.layer.borderColor = UIColor.init(hexString: "#C8CDD3").cgColor


                }
                cell.contentView.layer.borderWidth = 1
                cell.contentView.layer.cornerRadius = cell.contentView.frame.size.height / 2
                return cell
            }
            
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:(self.view.frame.size.width / 2.5 )    , height: (self.collViewFoodCat.frame.size.height ))

        

//        return CGSize(width:(self.collectionViewItems.frame.size.width / 2  ) - 20   , height: (self.collectionViewItems.frame.size.width / 2) - 20)
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
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrImg.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Customer_OrderTblCell") as! Customer_OrderTblCell
    
    cell.imgProfile.image = UIImage(named: arrImg[indexPath.row])
    cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.size.height / 2
    cell.imgProfile.layer.borderWidth = 8
    cell.imgProfile.layer.borderColor = UIColor.init(hexString: "EBEBEB").cgColor
    cell.lblFoodName.text = arrFoodName[indexPath.row]
    cell.cellView.layer.cornerRadius = 20.0
    cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.size.height/2
    cell.imgProfile.layer.masksToBounds = true
    

    
    return cell
}


    @IBAction func btnBackClick(_ sender:AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
  
       
    }
    
    

