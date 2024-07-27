//
//  AppDelegate.swift
//  Jampang
//
//  Created by Fitsyu  on 28/07/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)

        let hw = RoutesWireframe()
        
        window.rootViewController = hw.viewController
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}

