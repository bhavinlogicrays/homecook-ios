//
//  PreviewScreenVC.swift
//

import UIKit

class PreviewVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    // MARK: - Variables
    var arrIng = [[String:AnyObject]]  ()
    
    // MARK: - UIControls
    @IBOutlet weak var collectionDisplayImg: UICollectionView!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var detailTextView: UITextView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        arrFoodImg = [["img":"cart-img1","name":""],["img":"cart-img2"],["img":"cart-img3"]] as [[String : AnyObject]]
        
        
        
        arrIng = [["img":"Broccoli","name":"Salt","type":""],["img":"Chicken","name":"Chicken","type":""],["img":"onion","name":"Onion","type":"(Alergy)"],["img":"Garlic","name":"Pappers","type":""],["img":"Pappers","name":"Garlic","type":"(Alergy)"],["img":"Ginger","name":"Ginger","type":""],["img":"Broccoli","name":"Broccoli","type":""],["img":"Orange","name":"Orange","type":""],["img":"Walnut","name":"Walnut","type":""],["img":"Orange","name":"Orange","type":""]] as [[String : AnyObject]]
    }
    

    // MARK: - Delegate Methods
    // MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionDisplayImg{
        return 1
        }
        else{
        return arrIng.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionDisplayImg{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewVCCell", for: indexPath) as! PreviewVCCell
            
            //        cell.imgDisplay.image = UIImage(named: arrFoodImg[indexPath.row]["img"] as! String)
//            cell.imgDisplay.layer.cornerRadius = 25.0
            cell.viewOrderNo.layer.cornerRadius = cell.viewOrderNo.frame.size.width/2
            return cell
        }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewIngVCCell", for: indexPath) as! PreviewIngVCCell
            cell.imgIngrs.image = UIImage(named: arrIng[indexPath.row]["img"] as! String)
            cell.lblIngrName.text = arrIng[indexPath.row]["name"] as? String
            cell.lblIngrName2.text = arrIng[indexPath.row]["type"] as? String
            return cell

    }
    
    
}