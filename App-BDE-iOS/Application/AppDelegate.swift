//
//  AppDelegate.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 16/03/2021.
//

import SwiftUI
import Combine
import NetFox

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
            NFX.sharedInstance().start()
        #endif
        return true
    }
}
