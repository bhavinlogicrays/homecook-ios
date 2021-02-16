//
//  AppDelegate.swift
//  

import UIKit
import IQKeyboardManagerSwift
import Alamofire


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isLogin:Bool = false

    
    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet : Bool {
            return self.sharedInstance.isReachable
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        checkInternetConnection()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let strValue  =  UserDefaults.standard.value(forKey: "isLogin") as? String
        let strCome  =  UserDefaults.standard.value(forKey: "isCome") as? String

        if strValue == "true"  || strValue != nil {
            if strCome == "Chef" || strCome != nil {
                let initialViewController = STORYBOARD.instantiateViewController(withIdentifier: "TabVC") as! TabVC
                let navigationController = UINavigationController(rootViewController: initialViewController)
                navigationController.isNavigationBarHidden = true
                UIApplication.shared.delegate?.window!?.rootViewController = navigationController
            } else {
                let initialViewController1 = storyboard.instantiateViewController(withIdentifier: "Customer_TabVC") as! Customer_TabVC
                let navigationController = UINavigationController(rootViewController: initialViewController1)
                navigationController.isNavigationBarHidden = true
                UIApplication.shared.delegate?.window!?.rootViewController = navigationController

            }
        }
        else {
            let initialViewController11 = storyboard.instantiateViewController(withIdentifier: "WelComeVC") as! WelComeVC
            let navigationController = UINavigationController(rootViewController: initialViewController11)
            navigationController.isNavigationBarHidden = true
            UIApplication.shared.delegate?.window!?.rootViewController = navigationController
            

        }
        
        return true
    }

    //MARK:- All Functions
    
    func checkInternetConnection() {
        if Connectivity.isConnectedToInternet {
            print("Connected")
            API_SHARED.isConnected = true
        } else {
            print("No Internet")
            API_SHARED.isConnected = false
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        let removeSuc = KeychainWrapper.standard.removeObject(forKey: "email")
                let removeSuc1 = KeychainWrapper.standard.removeObject(forKey: "password")
                print("remove succ:\(removeSuc) \(removeSuc1)")

    }



}
