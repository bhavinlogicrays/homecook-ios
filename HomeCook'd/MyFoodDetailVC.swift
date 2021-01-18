//
//  MyFoodDetailVC.swift
//

import UIKit

class MyFoodDetailVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // MARK:- Variables
    var arrIng = [String]()
    var arrIngName = [String]()
    var arrIngName2 = [String]()
    
    // MARK:- UIControls
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblbreakfast: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var detailTextView: UITextView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgFood.layer.cornerRadius = 15.0
        imgFood.layer.masksToBounds = true
        
        setLblCor(label: lblbreakfast)
        setLblCor(label: lblTime)
        
        
        arrIng = ["Broccoli","Chicken","onion","Garlic","Pappers","Ginger","Broccoli","Orange","Walnut","Orange"]
        
        arrIngName = ["Salt","Chicken","Onion","Garlic","Pappers","Ginger","Broccoli","Orange","Walnut","Orange"]
        
        arrIngName2 = ["","","(Alergy)","","(Alergy)","","","","",""]
    }
    
    // MARK: - UI Methods
    func setLblCor(label: UILabel) {
        label.layer.cornerRadius = lblbreakfast.frame.size.height/2
        label.layer.masksToBounds = true
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnClickEdit(_ sender: Any) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "EditItemsVC") as! EditItemsVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrIng.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFoodDetailVCCell", for: indexPath) as! MyFoodDetailVCCell
        
        cell.imgIngrs.image = UIImage(named: arrIng[indexPath.row])
        cell.lblIngrName.text = arrIngName[indexPath.row]
        cell.lblIngrName2.text = arrIngName2[indexPath.row]
        
        return cell
    }
   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: SCREEN_WIDTH - 30.0 / 4.0, height: 95.0)
//    }
    
}
