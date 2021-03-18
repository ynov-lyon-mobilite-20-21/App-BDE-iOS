//
//  AppDelegate.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 16/03/2021.
//

import SwiftUI
import Combine

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NFX.sharedInstance().start()
        print("Your code here")
        return true
    }
}
