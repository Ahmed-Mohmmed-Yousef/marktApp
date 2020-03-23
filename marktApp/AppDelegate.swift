//
//  AppDelegate.swift
//  marktApp
//
//  Created by Ahmed on 2/5/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = ContainerController()
        window!.makeKeyAndVisible()
        return true
    }



}

