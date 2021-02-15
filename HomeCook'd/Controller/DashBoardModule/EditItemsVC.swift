//
//  EditItemsVC.swift
//

import UIKit
import  SDWebImage
import MobileCoreServices
import AVFoundation
import Alamofire
import SwiftyJSON

class EditItemsVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,CommonPickerViewDelegate {
   
    
    func didTapDone() {
        self.view.endEditing(true)

    }
    
    // MARK:- UIControls
    @IBOutlet weak var txtItmName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtEstTime: UITextField!
    @IBOutlet weak var collUploadPhoto: UICollectionView!
    @IBOutlet weak var collectionViewIngradients: UICollectionView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var btnSaveChanges: UIButton!
    @IBOutlet weak var collIngHeight: NSLayoutConstraint!
    @IBOutlet weak var txtcatType: UITextField!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var viewSub: UIStackView!
    @IBOutlet weak var conCollUploadHeight: NSLayoutConstraint!

    
    // MARK:- Variables
    var arrImg = [[String:Any]]()
    var arrMainIng = [IngArryStore]()
    var dictResponsefromDetail  = FoodDetail_SubRes()
    var dictAllIng  = IngModule()
    var dictsubIng  = IngGettingModel()
    var txtTemp: UITextField!

    fileprivate let pickerView = CommonPicker()
    var arrCatPick = [JSON]()
    var selectedIndex  = Int()
    let pickerController = UIImagePickerController()


    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        arrImg = [["img":"","isVideo":"0","videoUrl":""],["img":"","isVideo":"0","videoUrl":""],["img":"","isVideo":"0","videoUrl":""],["img":"","isVideo":"0","videoUrl":""]]
        btnReset.isSelected = false
        viewSub.isUserInteractionEnabled = false
       setUI()
        self.txtItmName.text = dictResponsefromDetail.itemName
        self.txtPrice.text = "$ \(dictResponsefromDetail.itemPrice ?? 0.00)"
        self.txtcatType.text = dictResponsefromDetail.catName
        self.callAllIngApi()
    }

    // MARK: - UI Methods
    func setUI() {
        
        CommonManager.setBorder(textField: txtItmName)
        CommonManager.setBorder(textField: txtPrice)
        CommonManager.setBorder(textField: txtEstTime)
        CommonManager.setCorner(button: btnSaveChanges)
        CommonManager.setBorder(textField: txtcatType)
        
        detailTextView.layer.masksToBounds = false
        detailTextView.layer.cornerRadius = 8.0
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        CommonManager.txtfiedSetColor(txtvalue:dictResponsefromDetail.itemName,textfield: self.txtItmName)
        CommonManager.txtfiedSetColor(txtvalue:"$ \(dictResponsefromDetail.itemPrice ?? 0.00)",textfield: self.txtPrice)
        CommonManager.txtfiedSetColor(txtvalue:"20 min",textfield: self.txtEstTime)
        CommonManager.txtfiedSetColor(txtvalue:dictResponsefromDetail.catName,textfield: self.txtcatType)
        CommonManager.txtViewSetColor(txtvalue:dictResponsefromDetail.itemDesc,textView: self.detailTextView)
        
        
    }
    
    // MARK: - IBAction Methods
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnClickReset(_ sender: Any) {
        btnReset.setTitle("RESET", for: .normal)
        if btnReset.isSelected {
            btnReset.isSelected = false
            viewSub.isUserInteractionEnabled = false
            CommonManager.txtfiedSetNewColor(textfield:txtItmName,hexaCode:"9C9BA6")
            CommonManager.txtfiedSetNewColor(textfield:txtPrice, hexaCode: "9C9BA6")
            CommonManager.txtfiedSetNewColor(textfield:txtcatType, hexaCode: "9C9BA6")
            CommonManager.txtfiedSetNewColor(textfield:txtItmName, hexaCode: "9C9BA6")
            CommonManager.txtfiedSetNewColor(textfield:txtEstTime, hexaCode: "9C9BA6")
            CommonManager.txtViewSetBlackColor(textView:detailTextView, hexaCode: "9C9BA6")

        } else {
            btnReset.isSelected = true
            viewSub.isUserInteractionEnabled = true
            CommonManager.txtfiedSetNewColor(textfield:txtItmName,hexaCode:"333333")
            CommonManager.txtfiedSetNewColor(textfield:txtPrice, hexaCode: "333333")
            CommonManager.txtfiedSetNewColor(textfield:txtcatType, hexaCode: "333333")
            CommonManager.txtfiedSetNewColor(textfield:txtItmName, hexaCode: "333333")
            CommonManager.txtfiedSetNewColor(textfield:txtEstTime, hexaCode: "333333")
            CommonManager.txtViewSetBlackColor(textView:detailTextView, hexaCode: "333333")
        }
    }
    
    @IBAction func onClickSaveChanges(_ sender: Any) {
          navigationController?.popViewController(animated: true)
    }

    
    // MARK: - Delegate Methods
    // MARK: UICollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == collectionViewIngradients{
            return arrMainIng.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == collectionViewIngradients {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "cellViewExpandCollapse", for: indexPath) as! cellViewExpandCollapse
            if arrMainIng[indexPath.section].arrIngList.count > 5 {
                headerView.btnFoodIng.isHidden = true
                headerView.imgDropdown.isHidden = true
            }
            else {
                headerView.btnFoodIng.isHidden = false
                headerView.imgDropdown.isHidden = false
            }
            
            
            headerView.lblHeaderTitle.text =  arrMainIng[indexPath.section].strIngType
            headerView.btnFoodIng.tag = indexPath.section
            headerView.btnFoodIng.addTarget(self, action: #selector(btnExpandTapp(_ :)), for: .touchUpInside)
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collUploadPhoto){
            return  arrImg.count
        }
        else {
            return arrMainIng[section].arrIngList.count
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(collectionView == collUploadPhoto){
            return CGSize.zero
        }
        return CGSize(width: collectionViewIngradients.frame.width, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == collUploadPhoto){
            let cell = collUploadPhoto.dequeueReusableCell(withReuseIdentifier: "CellUploadPhoto", for: indexPath) as! CellUploadPhoto
            let dict = arrImg[indexPath.row]
            if dict["img"] as? String != "" {
                cell.imgIngrs.image =  dict["img"] as? UIImage
            }
            else {
                cell.imgIngrs.image  = UIImage(named:"Group 3265")
            }
            if dict["isVideo"] as? String == "1" {
                cell.imgVideoIcon.isHidden = false
            }
            else {
                cell.imgVideoIcon.isHidden = true

            }
            cell.imgIngrs.layer.cornerRadius = 8.0
            cell.imgIngrs.layer.borderColor = UIColor.lightGray.cgColor
            cell.imgIngrs.layer.borderWidth = 1.0
            cell.btnPicker.tag  = indexPath.row
            cell.btnPicker.addTarget(self, action: #selector(btnVideoTapped(_:)), for: .touchUpInside)
            return cell
        }
        else {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditItemVCCell", for: indexPath) as! EditItemVCCell
            cell.imgIngrs.sd_setImage(with: URL(string:arrMainIng[indexPath.section].arrIngList[indexPath.row].ingName),placeholderImage: UIImage(named: "onion"))
//            if arrIng[indexPath.row].isSelected ==  1 {
//                cell.isSelected = true
//                cell.imgIngrs.image = UIImage(named: "onion")
//            }
//            else {
//                cell.isSelected = false
//                cell.imgIngrs.image = UIImage(named: "b-onion")
//
//            }
            cell.lblIngrName.text = arrMainIng[indexPath.section].arrIngList[indexPath.row].ingName
            cell.lblIngrName2.text = ""
            let arr1  = (self.arrMainIng[indexPath.section].arrIngList)
            if arrMainIng[indexPath.section].isExp == "0" {
                self.collIngHeight.constant = CGFloat(Float(self.arrMainIng.count) * (Float(arr1.count) / 5.0) * 100)
            } else {
                let floatingvalue  =  Double((Float(self.arrMainIng[indexPath.section].arrIngList.count)) / 5.0).rounded(.up)
                self.collIngHeight.constant = (CGFloat(floatingvalue * 100)) * CGFloat(self.arrMainIng.count)
            }
            self.collectionViewIngradients.layoutIfNeeded()
            self.collectionViewIngradients.updateConstraintsIfNeeded()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewIngradients {
            let value = self.arrMainIng[indexPath.section].isExp
            if value == "1"{
                return CGSize(width: self.collectionViewIngradients.frame.size.width / 5, height: self.collectionViewIngradients.frame.size.width / 5)
            }
            else {
                return CGSize(width: self.collectionViewIngradients.frame.size.width / 5, height: 90)
            }

        }
        else {
            return CGSize(width: self.collUploadPhoto.frame.size.width / 4 , height:self.collUploadPhoto.frame.size.width / 4)
        }

    }


    @objc func btnExpandTapp(_ sender:UIButton) {
        
        let btn = sender
        let  dict = self.arrMainIng[btn.tag]
        if dict.isExp == "1"{
            dict.isExp = "0"
        }
        else {
            dict.isExp = "1"
        }
        arrMainIng[btn.tag] = dict
        self.collectionViewIngradients.reloadData()
        self.collectionViewIngradients.reloadInputViews()
    }
    @objc func btnVideoTapped(_ sender:UIButton) {
        
        let alert = UIAlertController(title: "Choose Image/Video", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        selectedIndex = sender.tag

        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            pickerController.sourceType = .camera
            pickerController.allowsEditing = true
            pickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
            pickerController.cameraCaptureMode = .photo // Default media type .photo vs .video
            pickerController.cameraDevice = .rear // rear Vs front
            pickerController.cameraFlashMode = .off // on, off Vs auto

            self.present(pickerController, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func openGallary()
    {
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
        self.present(pickerController, animated: true, completion: nil)
    }


    
    //MARK:- Validation
    func checkValidation() {
//        guard let strItemName
        
        
        
        
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
    
    func generateThumbnail(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
}
extension EditItemsVC:UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      // Check for the media type
      let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! CFString
      switch mediaType {
      case kUTTypeImage:
        // Handle image selection result
        print("Selected media is image")
        let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
//        fooEditedImageView.image = editedImage
        for i in 0..<arrImg.count {
            if i == selectedIndex {
                var dict = arrImg[i]
                dict["img"] = editedImage
                dict["isVideo"] = "0"
                dict["videoUrl"] = ""

                arrImg[i] = dict
            }
        }
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        fooOriginalImageView.image = originalImage
        for i in 0..<arrImg.count {
            if i == selectedIndex {
                var dict = arrImg[i]
                dict["img"] = originalImage
                dict["isVideo"] = "0"
                dict["videoUrl"] = ""
                arrImg[i] = dict
            }
        }


      case kUTTypeMovie:
        // Handle video selection result
        print("Selected media is video")
        let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as! URL
        let img = generateThumbnail(path: videoUrl)
        for i in 0..<arrImg.count {
            if i == selectedIndex {
                var dict = arrImg[i]
                dict["img"] = img
                dict["isVideo"] = "1"
                dict["videoUrl"] = videoUrl
                arrImg[i] = dict
            }
        }

      default:
        print("Mismatched type: \(mediaType)")
      }

        picker.dismiss(animated: true, completion: {
            DispatchQueue.main.async {
                self.collUploadPhoto.reloadData()
            }

        })

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      // Dismiss the picker since it is not dismissed automatically
      picker.dismiss(animated: true, completion: nil)
    }


}

extension EditItemsVC:UIPickerViewDataSource,UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrCatPick.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrCatPick[row].stringValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtcatType.text = self.arrCatPick[row].stringValue
    }
    
    //MARK:- Api Call
    
    func callEditItemApi() {
        
    }
    func callAllIngApi() {
        let apiUrl = ApiList.URL.Host  + ApiList.URL.AllIngredientsList.allIng
        let strToken = UserDefaults.standard.value(forKey: "app_token") as? String
        let param = ["api_token":strToken ?? ""] as [String : Any]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        if !InternetConnectionManager.isConnectedToNetwork() {
                Utils.showMessage(type: .error, message: CommonManager.Messages.NoInternet)
            return
        }
        Utils.showProgressHud()

        API_SHARED.callAPIForGETorPOST(strUrl: apiUrl , parameters:param, httpMethodForGetOrPost: .post, setheaders: header) {[weak self] (dicResponseWithSuccess ,_)  in
            if let weakSelf = self {
                if  let jsonResponse = dicResponseWithSuccess {
                    guard jsonResponse.dictionary != nil else {
                        return
                    }
                    if let dicResponseData = jsonResponse.dictionary {
                        weakSelf.dictAllIng =
                            IngModule().initWithDictionary(dictionary: dicResponseData)
                        if weakSelf.dictAllIng.status == true {
                            
                            weakSelf.dictsubIng = weakSelf.dictAllIng.dictAllIng
                            weakSelf.arrMainIng =  weakSelf.dictsubIng.arrGetIng
                            print(weakSelf.arrMainIng.count)
                            weakSelf.arrCatPick = weakSelf.dictAllIng.dictAllIng.arrFoodType
                            if weakSelf.arrMainIng.count > 0 {
                                for i in 0..<weakSelf.arrMainIng.count
                                {
                                    let dict  = weakSelf.arrMainIng[i]
                                    dict.isExp = "0"
                                    weakSelf.arrMainIng[i] = dict
                                }
                                weakSelf.collIngHeight.constant = CGFloat(weakSelf.arrMainIng.count * 150)
                                DispatchQueue.main.async {
                                    weakSelf.collectionViewIngradients.reloadData()
                                    weakSelf.collectionViewIngradients.layoutIfNeeded()
                                    weakSelf.collectionViewIngradients.updateConstraintsIfNeeded()

                                }
                    }
                    
                            weakSelf.pickerController.delegate = weakSelf
                            weakSelf.pickerView.dataSource = weakSelf
                            weakSelf.pickerView.delegate = weakSelf
                            weakSelf.pickerView.toolbarDelegate = weakSelf
                            weakSelf.txtcatType.inputView = weakSelf.pickerView
                            weakSelf.txtcatType.inputAccessoryView = weakSelf.pickerView.toolbar
                            weakSelf.pickerView.selectRow(0, inComponent: 0, animated: false)
                        }
                        
                    } else {
                        Utils.showMessage(type: .error, message: "Something went wrong!")
                    }

                } else {
                }

            }
    }
    }
    

}
