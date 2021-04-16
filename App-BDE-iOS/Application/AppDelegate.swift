//
//  AppDelegate.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 16/03/2021.
//

import SwiftUI
import Combine
import Stripe
import NetFox

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
        
        switch userActivity.activityType {
                case NSUserActivityTypeBrowsingWeb:
                guard let url = userActivity.webpageURL else { return false }
                    print("Universal link url : \(url)")
                // display the correct screen corresponding to the url
                return true
                default: return false
            }
        
//        // Get URL components from the incoming user activity.
//        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
//              let incomingURL = userActivity.webpageURL,
//              let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else {
//            return false
//        }
//
//        // Check for specific URL components that you need.
//        guard let path = components.path,
//              let params = components.queryItems else {
//            return false
//        }
//        print("path = \(path)")
//
//        if let paymentReturn = params.first(where: { $0.name == "stripe/paymentReturn" } )?.value {
//
//            print("paymentReturn = \(paymentReturn)")
//            return true
//
//        } else {
//            print("Missing stripe payment return")
//            return false
//        }
        return true
    }
}
