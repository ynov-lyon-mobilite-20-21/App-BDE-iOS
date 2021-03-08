//
//  TabViewProvider.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 09/03/2021.
//

import Foundation
import SwiftUI

class TabViewProvider: ObservableObject {
    
    enum Tabs: Int {
        case event = 0
        case profil = 1
    }
    
    static let shared: TabViewProvider = TabViewProvider()
    var currentTab = Tabs.event {
        didSet {
            objectWillChange.send()
        }
    }

    func changeTab(to tab: Tabs) {
        currentTab = tab
    }
}
