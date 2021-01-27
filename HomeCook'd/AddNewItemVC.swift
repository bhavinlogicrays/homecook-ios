//
//  AddNewItemVC.swift
//

import UIKit

class AddNewItemVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate {
    
    // MARK: - Variables
    var arrImg = [String]()
    var arrIng = [String]()
    var arrIngName = [String]()
    var arrFruitImg = [String]()
    var arrFruitName = [String]()
    
    // MARK: - UIControls
    @IBOutlet weak var txtItemName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtEstTime: UITextField!
    @IBOutlet weak var collectionViewUploadPhoto: UICollectionView!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var collectionViewFruits: UIView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var btnPublishItem: UIButton!
    
    var txtTemp: UITextField!
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailTextView.layer.cornerRadius = 8.0
        detailTextView.layer.borderColor = UIColor.lightGray.cgColor
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.masksToBounds = true
        
        DELEGATE.setCorner(button: btnPublishItem)
        
        DELEGATE.setBorder(textField: txtItemName)
        DELEGATE.setBorder(textField: txtPrice)
        DELEGATE.setBorder(textField: txtEstTime)
        
        
        self.view.endEditing(true)
        
        
        txtPrice.attributedPlaceholder = NSAttributedString(string:"$50", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPrice.setRightPaddingPoints(15)
        txtPrice.setLeftPaddingPoints(15)
        
        txtEstTime.attributedPlaceholder = NSAttributedString(string:"20 min", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEstTime.setRightPaddingPoints(15)
        txtEstTime.setLeftPaddingPoints(15)
        
        txtItemName.attributedPlaceholder = NSAttributedString(string:"Mazalichiken Halim", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtItemName.setRightPaddingPoints(15)
        txtItemName.setLeftPaddingPoints(15)
        
        
        arrImg = ["Group 3265","Group 3265","Group 3265","Group 3265"]
    
        arrIng = ["b-Avocado","b-Apple","b-blueberry","b-broccoli","b-Chicken","b-Garlic","b-onion","b-orange","b-Pappers","b-Salt"]
        arrIngName = ["Avocado","Apple","blueberry","broccoli","Chicken","Garlic","onion","orange","Pappers","Salt"]
        arrFruitImg = ["b-Avocado","b-Apple","b-blueberry","b-broccoli","b-Chicken","b-Garlic","b-onion","b-orange","b-Pappers","b-Salt"]
        arrFruitName = ["Avocado","Apple","blueberry","broccoli","Chicken","Garlic","onion","orange","Pappers","Salt"]
    }
    
    // MARK: - UI Methods
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickPublishItems(_ sender: Any) {
//        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "MyFoodVC") as! MyFoodVC
//        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    // MARK: - Delegate Methods
    // MARK: UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectionViewUploadPhoto){
            return arrImg.count
        }
        else if(collectionView == collectionViewIngradients){
            return arrIng.count
        }
        else{
            return arrFruitImg.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == collectionViewUploadPhoto){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewItemVCCell", for: indexPath) as! AddNewItemVCCell
            
            cell.imgFood.image = UIImage(named: arrImg[indexPath.row])
            cell.imgFood.layer.cornerRadius = 10.0
            cell.imgFood.layer.masksToBounds = true
            return cell
        }
        else if(collectionView == collectionViewIngradients){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewItemVCCell", for: indexPath) as! AddNewItemVCCell
            
            cell.imgIngrs.image = UIImage(named: arrIng[indexPath.row])
            cell.lblIngrName.text = arrIngName[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddNewItemVCCell", for: indexPath) as! AddNewItemVCCell
            
            cell.imgFruit.image = UIImage(named: arrFruitImg[indexPath.row])
            cell.lblFruitName.text = arrFruitName[indexPath.row]
            return cell
        }
        
    }
    
    // MARK: - Delegate Methods
    // MARK: UITextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtTemp = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtTemp.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtTemp.text = txtTemp.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        txtTemp.resignFirstResponder()
        txtTemp = nil
    }
}
