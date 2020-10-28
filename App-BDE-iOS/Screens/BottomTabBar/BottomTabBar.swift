//
//  BottonTabView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct BottomTabBar: View {
    
    @Binding var selected: String
    @Binding var showModal: Bool
    
    var body: some View {
        HStack(spacing:0) {
            Spacer()
            TabBarButton(selected: $selected, value: "Event", imageSelected:"ticket-gris-outline", imageUnselected: "ticket-noir-outline")
            Spacer()
            BottomTabBarModalItem() {
                self.showModal.toggle()
            }
            Spacer()

            TabBarButton(selected: $selected, value: "Profil", imageSelected: "user-gris-outline", imageUnselected: "user-noir-outline")
            Spacer()

        }
    }
}

struct BottonTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar(selected: .constant("Event"), showModal: .constant(false))
    }
}





//BottomTabBarModalItem() {
//    self.showModal.toggle()
//}.offset(y: -55)
