//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentView: Tab = .Tab1
    @State private var showModal: Bool = false
    var body: some View {
            VStack {
                CurrentScreen(currentView: self.$currentView)
                BottomTabBar(currentView: self.$currentView, showModal: self.$showModal)
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
