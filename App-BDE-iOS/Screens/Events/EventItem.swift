//
//  EventItem.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    var body: some View {
        VStack {
            VStack() {
                Image("LAN-card")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.blueToBlack)
                    .frame(minHeight: 0, maxHeight: 500)
                
                HStack {
                    VStack {
                        Image("LAN_manette")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all, 5)
                            .foregroundColor(.whiteToYellow)                    }
                        .frame(width: 50, height: 50)
                        .background(Color.bdeBlue)
                        .cornerRadius(10)
                        .padding()
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(event.type ?? "")
                            .font(.headline).foregroundColor(.gray)
                        Text(event.name ?? "")
                            .font(.title2).bold()
                            .foregroundColor(.blackToGreen)
                    }
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: 75)
                .background(Color.whiteToBlue)
            }
        }
        .background(Color.whiteToBlue)
        .cornerRadius(30)
        
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5))
        
        
        
    }
}



