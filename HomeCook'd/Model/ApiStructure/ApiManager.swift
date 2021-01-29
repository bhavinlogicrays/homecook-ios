//
//  ApiManager.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 20/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class ApiManager:NSObject{
    static let sharedInstance: ApiManager = {
        let instance = ApiManager()
        instance.initialize()
        return instance
    }()
   
    func initialize() {
    }

    func callAPIForGETorPOST(strUrl : String?, parameters: [String : Any]?, httpMethodForGetOrPost : Alamofire.HTTPMethod?, setheaders:HTTPHeaders,withJsonResponseValue: ((JSON?, Int?) -> Void)?) {
            print("Parameters", parameters as Any)
        AF.request(strUrl!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: setheaders).responseJSON { [weak self] (response) in
            var json = JSON()
                    if let WeakSelf = self {
                        
                        switch response.result {
                               case .success(let data):
                                Utils.hideProgressHud()
                                json = JSON(data)
                                guard json.dictionary != nil else { return }
                                withJsonResponseValue?(json,response.response?.statusCode)
                                break
                               case .failure(let error):
                                Utils.hideProgressHud()
                                print(error)
                                   break
                               }
                    }
        
                }
    }

//For array Response api
//    AF.request(baseURLString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: AppStatus.shared.headers).responseData { [weak self] (response) in
//        if let WeakSelf = self {
//            if let statusCode = response.response?.statusCode {
//                if statusCode == 200 {
//                    DispatchQueue.main.async {
//                        if WeakSelf.currentUserProfile != nil {
//                            WeakSelf.currentUserProfile?.isFollower = true
//                        }
//                        WeakSelf.reloadCollectionView()
//                        WeakSelf.sendFollowAPIProcess.status = .success("Follow Request sent")
//                    }
//                } else if statusCode == 401 {
//                    appDelegate.getFirebaseAuthenticationToke()
//                    WeakSelf.sendFollowRequest(followUserId: followUserId, currentUserId: currentUserId)
//                } else {
//                    DispatchQueue.main.async {
//                        WeakSelf.sendFollowAPIProcess.status = .failed("Your recquest could not be completed")
//                    }
//                }
//            } else {
//                //other errors like no internet
//                DispatchQueue.main.async {
//                    WeakSelf.sendFollowAPIProcess.status = .failed("Internet conennection appears to be offline.")
//                }
//            }
//
//        }
//    }.cURLDescription { (url) in
//        print("sendFollowRequest " + url)
//    }
}

