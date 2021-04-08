//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct HomeView: View {
    
//       override init() {
//            UITabBar.appearance().barTintColor = .systemBackground
//            UINavigationBar.appearance().barTintColor = .systemBackground
//        }
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var tabViewProvider: TabViewProvider = TabViewProvider.shared
    
    var body: some View {
        VStack(spacing: 0) {
            switch tabViewProvider.currentTab {
            case .event:
                ViewProvider.event()
                
            case .contact:
                ContactsView()
                
            case .profil:
                ViewProvider.profile()
                
            }
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(TabViewProvider.Tabs.allCases, id: \.rawValue) { tab in
                    Button(action: {
                        if tabViewProvider.currentTab == tab {
                            return
                        } else {
                            tabViewProvider.changeTab(to: tab)
                        }
                    }, label: {
                        Spacer()
                        VStack {
                            Image(viewModel.tabBarImageNames[tab.rawValue].tabImage)
                                .renderingMode(.template)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(tabViewProvider.currentTab == tab ? Color.bdePink : Color(.gray))
                            Text(viewModel.tabBarImageNames[tab.rawValue].tabName)
                                .font(.system(size: 12))
                                .foregroundColor(tabViewProvider.currentTab == tab ? Color.bdePink : Color(.gray))
                        }
                        Spacer()
                    })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(viewModel: HomeViewModel())
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 11")
            HomeView(viewModel: HomeViewModel())
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
