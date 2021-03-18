//
//  EntryPoint.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 09/03/2021.
//

import SwiftUI
import Combine

@main
struct EntryPoint: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ErrorHandler {
                ViewProvider.onBoarding()
            }
        }
    }
}
