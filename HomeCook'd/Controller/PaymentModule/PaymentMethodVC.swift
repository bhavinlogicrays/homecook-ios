//
//  PaymentMethodVC.swift
//

import UIKit

class PaymentMethodVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    // MARK: - Variables
    var arrImg = [String]()
    var arrCardName = [String]()
    
    // MARK: - UIControls
    @IBOutlet weak var collectionViewPayMethod: UICollectionView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var btnAddNew: UIButton!
    @IBOutlet weak var btnWithdraw: UIButton!
    
    // MARK:- ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewCard.layer.cornerRadius = 15.0
        
        btnAddNew.layer.masksToBounds = false
        btnAddNew.layer.cornerRadius = 6.0
        btnAddNew.layer.borderWidth = 1.0
        btnAddNew.layer.borderColor = UIColor.init(red: 251.0/255.0, green: 109.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
       
        btnWithdraw.layer.cornerRadius = 10.0
        btnWithdraw.layer.masksToBounds = true
        btnWithdraw.clipsToBounds = false
        
        arrImg = ["visa","master-card","paypal-icon","paypal-icon"]
        arrCardName = ["Visa","Mastercard","Paypal","Paypal"]
    }
    
    // MARK: - UI Methods
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickWithdraw(_ sender: UIButton) {
       
            let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PaymentSuccessVC") as! PaymentSuccessVC
            self.navigationController?.pushViewController(objVC, animated: true)
        
    }
    
    // MARK: - Delegate Methods
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentMethodVCCell", for: indexPath) as! PaymentMethodVCCell
        cell.imgCard.image = UIImage(named: arrImg[indexPath.row])
        cell.lblCardName.text = arrCardName[indexPath.row]
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = true
        cell.cellView.layer.cornerRadius = 10.0
        cell.cellView.layer.masksToBounds = true
        return cell
    }
  
}
