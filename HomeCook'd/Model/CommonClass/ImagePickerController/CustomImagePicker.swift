//
//  CustomImagePicker.swift
//  HomeCook'd
//
//  Created by admin on 10/02/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class CustomImagePicker: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
  
  @IBAction func selectImageAction(_ sender: UIButton) {
    let pickerController = UIImagePickerController()
    // Part 1: File origin
    pickerController.sourceType = .camera
    
    // Must import `MobileCoreServices`
    // Part 2: Define if photo or/and video is going to be captured by camera
    pickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
    
    // Part 3: camera settings
    pickerController.cameraCaptureMode = .photo // Default media type .photo vs .video
    pickerController.cameraDevice = .rear // rear Vs front
    pickerController.cameraFlashMode = .on // on, off Vs auto
    // Part 4: User can optionally crop only a certain part of the image or video with iOS default tools
    pickerController.allowsEditing = true
    
    // Part 5: For callback of user selection / cancellation
    pickerController.delegate = self

    // Part 6: Present the UIImagePickerViewController
    present(pickerController, animated: true, completion: nil)
  }
    

}

