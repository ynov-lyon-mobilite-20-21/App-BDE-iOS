//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
    @State private var showModal: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.tabViewProvider.currentTab) {
                ViewProvider.event()
                    .tabItem {
                        Image(Asset.TabBar.ticketNoir.name)
                            .renderingMode(.template)
                            .foregroundColor(Color.blackToWhite)
                        Text(L10n.TabBar.event)
                    }
                    .tag(TabViewProvider.Tabs.event)
                
                ViewProvider.profile()
                    .tabItem {
                        Image(Asset.TabBar.profilNoir.name)
                            .renderingMode(.template)
                            .foregroundColor(Color.blackToWhite)
                        Text(L10n.TabBar.profil)
                    }
                    .tag(TabViewProvider.Tabs.profil)
            }
            .accentColor(.blackToWhite)

            BottomTabBarModalItem {
                self.showModal.toggle()
            }.offset(y: -8)
        }
        .sheet(isPresented: self.$showModal) { ContactsView() }
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
