//
//  Customer_PaymentVC.swift
//

import UIKit

class Customer_PaymentVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    // MARK: - Variables
    var arrImg = [String]()
    var arrCardName = [String]()
    // MARK: - UIControls
    @IBOutlet weak var collectionViewPayMethod: UICollectionView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var btnAddNew: UIButton!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var viewPaymentWithdraw: UIView!
    @IBOutlet weak var txtAdd: UITextField!
    
    // MARK:- ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewCard.layer.cornerRadius = 15.0
        
        viewPaymentWithdraw.layer.cornerRadius = 33.0
        
        btnAddNew.layer.masksToBounds = false
        btnAddNew.layer.cornerRadius = 6.0
        btnAddNew.layer.borderWidth = 1.0
        btnAddNew.layer.borderColor = UIColor.init(red: 235.0/255.0, green: 57.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor
        
        btnAddNew.layer.masksToBounds = false
        btnAddNew.layer.cornerRadius = 10.0
        
        
       
        btnConfirm.layer.cornerRadius = 10.0
        btnConfirm.layer.masksToBounds = true
        btnConfirm.clipsToBounds = false
        
        arrImg = ["visa","master-card","paypal-icon","paypal-icon"]
        arrCardName = ["Visa","Mastercard","Paypal","Paypal"]
    }
    
    // MARK: - UI Methods
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickConfirm(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "PaymentSuccessVC") as! PaymentSuccessVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickAdres(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC2") as! AddressVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickEdit(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddressVC2") as! AddressVC2
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    @IBAction func onClickAddNew(_ sender: UIButton) {
        let objVC = STORYBOARD.instantiateViewController(withIdentifier: "AddNewCardVC") as! AddNewCardVC
        self.navigationController?.pushViewController(objVC, animated: true)
    }
    
    
    
    // MARK: - Delegate Methods
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Customer_PaymentVCCell", for: indexPath) as! Customer_PaymentVCCell
        cell.imgCard.image = UIImage(named: arrImg[indexPath.row])
        cell.lblCardName.text = arrCardName[indexPath.row]
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = true
        cell.cellView.layer.cornerRadius = 10.0
        cell.cellView.layer.masksToBounds = true
        return cell
    }
  
    

    
}
