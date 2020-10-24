//
//  BottomTabBarItem.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct BottomTabBarItem: View {
    
    @Binding var currentView: Tab
    let imageName: String
    let paddingEdges: Edge.Set
    let title: String
    let tab: Tab
    
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .frame(width: 40, height: 40, alignment: .center)
            Text(title)
                .font(.custom("Fashion Fetish Regular", size: self.currentView == tab ? 14 : 12))
        }
        .frame(width: 100, height: 50)
        .onTapGesture { self.currentView = self.tab }
        .padding(paddingEdges, 15)
    }
}

struct BottomTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarItem(currentView: .constant(.Tab1), imageName: "gear", paddingEdges: .leading, title: "Evenement",tab: .Tab1)
    }
}
