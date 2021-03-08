//
//  EntryPoint.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 09/03/2021.
//

import SwiftUI

@main
struct EntryPoint: App {
    
    var body: some Scene {
        WindowGroup {
            ErrorHandler {
                ViewProvider.onBoarding()
            }
        }
    }
}
