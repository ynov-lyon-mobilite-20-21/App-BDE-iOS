//
//  BottonTabView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct BottomTabBar: View {
    
    @Binding var currentView: Tab
    @Binding var showModal: Bool
    
    var body: some View {
        HStack {
            BottomTabBarItem(currentView: self.$currentView, imageName: "ticket-gris-outline", paddingEdges: .leading, title: "Evenement", tab: .Tab1)
            Spacer()

            BottomTabBarModalItem() {
                self.showModal.toggle()
            }.offset(y: -55)
            
            Spacer()
            BottomTabBarItem(currentView: self.$currentView, imageName: "user-gris-outline", paddingEdges: .trailing, title: "Profil", tab: .Tab2)
        }
        .frame(minHeight: 70)
    }
}

struct BottonTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar(currentView: .constant(.Tab1), showModal: .constant(false))
    }
}



