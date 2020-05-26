//
//  AppDelegate.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/8/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController:  Router().initialViewController())
        window?.makeKeyAndVisible()
        return true
    }

}

