//
//  CurrentScreen.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct CurrentScreen: View {
        
    @Binding var currentView: Tab
    var body: some View {
        VStack {
            if self.currentView == .Tab1 {
                EventView()
            } else {
                ProfilView()
            }
        }
    }
}

struct CurrentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScreen(currentView: .constant(.Tab1))
    }
}
