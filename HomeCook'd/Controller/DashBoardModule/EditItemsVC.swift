//
//  EditItemsVC.swift
//

import UIKit

class EditItemsVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout {
    
    // MARK:- Variables
    var arrImg = [String]()
    var arrIng = [String]()
    var arrIngName = [String]()
    var arrFruitImg = [String]()
    var arrFruitName = [String]()
    var arrIngName2 = [String]()
    
    // MARK:- UIControls
    @IBOutlet weak var txtItmName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtEstTime: UITextField!
    @IBOutlet weak var collectionViewUploadPhoto: UICollectionView!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var collectionViewFruits: UIView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var btnSaveChanges: UIButton!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    var txtTemp: UITextField!
    
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setUI()
        
        arrImg = ["img1-running-order","Group 3265","Group 3265","Group 3265"]
        arrIng = ["Broccoli","Chicken","onion","Garlic","Pappers"]
        arrIngName = ["Chicken","onion","Garlic","Pappers","Ginger"]
        arrIngName2 = ["","(Alergy)","","(Alergy)",""]
        arrFruitImg = ["b-Avocado","b-Apple","b-blueberry","b-broccoli","b-Chicken"]
        arrFruitName = ["Avocado","Apple","blueberry","broccoli","Chicken"]
        
    }

    // MARK: - UI Methods
    func setUI(){
        CommonManager.setBorder(textField: txtItmName)
        CommonManager.setBorder(textField: txtPrice)
        CommonManager.setBorder(textField: txtEstTime)
        CommonManager.setCorner(button: btnSaveChanges)
        
        detailTextView.layer.masksToBounds = false
        detailTextView.layer.cornerRadius = 8.0
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        txtPrice.attributedPlaceholder = NSAttributedString(string:"$50", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtPrice.setRightPaddingPoints(15)
        txtPrice.setLeftPaddingPoints(15)
        
        txtEstTime.attributedPlaceholder = NSAttributedString(string:"20 min", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtEstTime.setRightPaddingPoints(15)
        txtEstTime.setLeftPaddingPoints(15)
        
        txtItmName.attributedPlaceholder = NSAttributedString(string:"Mazalichiken Halim", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtItmName.setRightPaddingPoints(15)
        txtItmName.setLeftPaddingPoints(15)
        
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnClickReset(_ sender: Any) {
    }
    
    @IBAction func onClickSaveChanges(_ sender: Any) {
          navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSeeAll(_ sender: Any) {
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditItemVCCell", for: indexPath) as! EditItemVCCell
            
            cell.imgFood.image = UIImage(named: arrImg[indexPath.row])
            cell.imgFood.layer.cornerRadius = 10.0
            cell.imgFood.layer.masksToBounds = true
            return cell
        }
        else if(collectionView == collectionViewIngradients){
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditItemVCCell", for: indexPath) as! EditItemVCCell
            
            cell.imgIngrs.image = UIImage(named: arrIng[indexPath.row])
            cell.lblIngrName.text = arrIngName[indexPath.row]
            cell.lblIngrName2.text = arrIngName2[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditItemVCCell", for: indexPath) as! EditItemVCCell
            
            cell.imgFruit.image = UIImage(named: arrFruitImg[indexPath.row])
            cell.lblFruitName.text = arrFruitName[indexPath.row]
            return cell
        }
       
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//           return CGSizeZero
//
//        }

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
