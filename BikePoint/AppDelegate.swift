//
//  AppDelegate.swift
//  BikePoint
//
//  Created by Александр on 27.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        SessionData.shared.userToken = nil
        
        var initialVC : UIViewController?
        
        if (SessionData.shared.userToken != nil) {
        
            initialVC = UIStoryboard.main.instantiateViewController(withIdentifier: "NavigationController" )
            
        } else {
        
            initialVC = UIStoryboard.signIn.instantiateViewController(withIdentifier: "NavigationController")
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = initialVC
        
        window?.makeKeyAndVisible()
        // я вообще невтупляю)))
//        LocationManager.shared.addObserver(self, forKeyPath: "currentLocation",
//                                           options: [.new, .initial], context: nil)
        
        return true
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(keyPath ?? "UNKNOWN")
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
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) ->
        
        UIInterfaceOrientationMask {
            
        if let navVC = UIViewController.topViewController() as? UINavigationController,
            navVC.topViewController is MainViewController {
            
            return .all
            
        } else {
            
            return .portrait
        }
    }
}

