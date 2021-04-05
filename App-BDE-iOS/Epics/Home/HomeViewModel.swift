//
//  File.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import SwiftUI

class HomeViewModel: BaseViewModel {
     
    @ObservedObject var tabViewProvider = TabViewProvider.shared
    let tabBarImageNames = [TabBarIcon(tabImage: Asset.TabBar.ticketGris.name,
                                       tabName: L10n.TabBar.event),
                            TabBarIcon(tabImage: Asset.TabBar.contactGris.name,
                                       tabName: L10n.TabBar.contact),
                            TabBarIcon(tabImage: Asset.TabBar.profilGris.name,
                                       tabName: L10n.TabBar.profil)]
}

struct TabBarIcon {
    var tabImage: String
    var tabName: String
}
