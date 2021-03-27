//
//  BottomTabBarModalItem.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct BottomTabBarModalItem: View {
    let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.whiteToBlack)
                .frame(width: 85, height: 85)
                .shadow(radius: 6 )
            Image("logo_bde")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
        }
        .onTapGesture(perform: action)
    }
}

struct BottomTabBarModalItem_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarModalItem {}

    }
}
