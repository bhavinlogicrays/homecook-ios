//
//  Utils.swift
//  HomeCook'd
//
//  Created by Khushbu Lotia on 22/01/21.
//  Copyright © 2021 Sheela Dodiya. All rights reserved.
//

import Foundation
import SVProgressHUD
import SwiftMessages

class Utils {
    
    class func showProgressHud() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(UIColor.black)
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setDefaultMaskType(.black)
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    class func hideProgressHud() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    class func showMessage(type: Theme, title:String? = nil, message:String) {
        DispatchQueue.main.async {
            var config = SwiftMessages.Config()
            // Slide up from the bottom.
            config.presentationStyle = .top
            // Display in a window at the specified window level: UIWindow.Level.statusBar
            // displays over the status bar while UIWindow.Level.normal displays under.
            config.presentationContext = .window(windowLevel: .normal)
            let view = MessageView.viewFromNib(layout: .cardView)
                       // Theme message elements with the warning style.
                       view.configureTheme(type)
                       // Add a drop shadow.
                       view.configureDropShadow()
            view.bodyLabel?.font = UIFont.getAppFont(of: .normal, size: 18)
                       view.button?.isHidden = true
                       // Show the message.
                       if title == nil {
                           view.titleLabel?.isHidden = true
                           view.configureContent(body: message)
                       } else {
                           view.configureContent(title: title!, body: message)
                       }
            SwiftMessages.show(config: config, view: view)
        }
    }
    
    

}
