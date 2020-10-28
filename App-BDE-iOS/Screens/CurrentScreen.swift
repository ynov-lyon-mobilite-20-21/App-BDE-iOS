//
//  CurrentScreen.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct CurrentScreen: View {
        
    @Binding var selected: String
    var body: some View {
        VStack {
            if self.selected == "Event" {
                EventView()
                    .tag("Event")
                
            } else {
                ProfilView()
                    .tag("Profil")
            }
        }
    }
}

struct CurrentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScreen(selected: .constant("Event"))
    }
}
