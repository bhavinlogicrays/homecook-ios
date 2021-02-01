//
//  EditItemsVC.swift
//

import UIKit

class EditItemsVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate {
    
    // MARK:- Variables
    var arrImg = [String]()
    var arrIng = [[String:Any]]()
    var arrFruit = [[String:Any]]()
    var arrIngName2 = [String]()
    
    // MARK:- UIControls
    @IBOutlet weak var txtItmName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtEstTime: UITextField!
    @IBOutlet weak var collectionViewUploadPhoto: UICollectionView!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var collectionViewFruits: UICollectionView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var btnSaveChanges: UIButton!
    @IBOutlet weak var collIngHeight: NSLayoutConstraint!
    @IBOutlet weak var collFruitHeight: NSLayoutConstraint!

    var txtTemp: UITextField!
    var isExpanded:Bool = false
    var isExpandedFruit:Bool = false

    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       setUI()
        
        arrImg = ["img1-running-order","Group 3265","Group 3265","Group 3265"]
        arrIng = [["img":"Broccoli","title":"Brocoli","subtitle":""],["img":"Chicken","title":"Chicken","subtitle":"(Alergy)"],["img":"onion","title":"Onion","subtitle":""],["img":"Garlic","title":"Garlic","subtitle":"(Alergy)"],["img":"Pappers","title":"Pappers","subtitle":""],["img":"Broccoli","title":"Brocoli","subtitle":""],["img":"Chicken","title":"Chicken","subtitle":"(Alergy)"],["img":"onion","title":"Onion","subtitle":""],["img":"Garlic","title":"Garlic","subtitle":"(Alergy)"],["img":"Pappers","title":"Pappers","subtitle":""]] as [[String:Any]]
        arrFruit  = [["img":"b-Avocado","title":"Avocado","subtitle":""],["img":"b-Apple","title":"Apple","subtitle":"(Alergy)"],["img":"b-blueberry","title":"Blueberry","subtitle":""],["img":"b-broccoli","title":"Broccoli","subtitle":"(Alergy)"],["img":"b-Chicken","title":"Chicken","subtitle":""],["img":"b-Avocado","title":"Avocado","subtitle":""],["img":"b-Apple","title":"Apple","subtitle":"(Alergy)"],["img":"b-blueberry","title":"Blueberry","subtitle":""],["img":"b-broccoli","title":"Broccoli","subtitle":"(Alergy)"],["img":"b-Chicken","title":"Chicken","subtitle":""]] as [[String:Any]]

        self.collFruitHeight.constant = 80
            self.collectionViewIngradients.contentSize.height = 100
        self.collectionViewFruits.layoutIfNeeded()
        self.collectionViewFruits.updateConstraintsIfNeeded()
        self.collectionViewIngradients.collectionViewLayout.invalidateLayout()


    }

    // MARK: - UI Methods
    func setUI() {
        
//        CommonManager.setBorder(textField: txtItmName)
//        CommonManager.setBorder(textField: txtPrice)
//        CommonManager.setBorder(textField: txtEstTime)
        CommonManager.setCorner(button: btnSaveChanges)
        
//        detailTextView.layer.masksToBounds = false
//        detailTextView.layer.cornerRadius = 8.0
//        detailTextView.layer.borderWidth = 1.0
//        detailTextView.layer.borderColor = UIColor.lightGray.cgColor
        
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
    @IBAction func onClickIng(_ sender: Any) {
        if isExpanded {
            isExpanded = false
        }
        else {
            isExpanded = true
        }
        self.collectionViewIngradients.reloadData()
    }
    
    @IBAction func onClickFruit(_ sender: Any) {
        if isExpandedFruit {
            isExpandedFruit = false
        }
        else {
            isExpandedFruit = true
        }
        self.collectionViewFruits.reloadData()
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
            return arrFruit.count
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
            cell.imgIngrs.image = UIImage(named: arrIng[indexPath.row]["img"]! as! String)
            cell.lblIngrName.text = arrIng[indexPath.row]["title"] as? String ?? ""
            cell.lblIngrName2.text = arrIng[indexPath.row]["subtitle"] as? String ?? ""
            if isExpanded == false {
                self.collIngHeight.constant = 100
            }
            else {
                self.collIngHeight.constant = 200
            }
            self.collectionViewIngradients.layoutIfNeeded()
            self.collectionViewIngradients.updateConstraintsIfNeeded()
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditItemVCCell", for: indexPath) as! EditItemVCCell
            cell.imgIngrs.image = UIImage(named: arrFruit[indexPath.row]["img"]! as! String)
            cell.lblIngrName.text = arrFruit[indexPath.row]["title"] as? String ?? ""

//            cell.imgFruit.image = UIImage(named: arrFruit[indexPath.row]["img"]! as! String)
//            cell.lblFruitName.text = arrFruit[indexPath.row]["title"] as? String ?? ""
            if isExpandedFruit == false {
                self.collFruitHeight.constant = 80
            }
            else {
                self.collFruitHeight.constant = 160
            }
            self.collectionViewFruits.layoutIfNeeded()
            self.collectionViewFruits
                .updateConstraintsIfNeeded()
            return cell
        }
       
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewIngradients {
            return CGSize(width: self.view.frame.size.width / 5, height: 90)
        }
        else if collectionView == collectionViewFruits {
            return CGSize(width: self.collectionViewFruits.frame.size.width / 5 , height:80)
        }
        return CGSize(width: self.view.frame.size.width / 5 , height:90)

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
