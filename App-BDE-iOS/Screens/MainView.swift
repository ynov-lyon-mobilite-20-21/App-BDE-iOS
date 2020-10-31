//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct MainView: View {
    
    @State private var showModal: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                            EventView()
                                .tabItem {
                                    Image(systemName: "house")
                                    Text("Event")
                                }
                            
                            ProfilView()
                                .tabItem {
                                    Image(systemName: "house")
                                    Text("Event")
                                }
                        }
            .accentColor(.blue)
            
            BottomTabBarModalItem() {
                self.showModal.toggle()
            }.offset(y: -15)
        }
        .sheet(isPresented: self.$showModal) { ContactsView() }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 11")
            MainView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
