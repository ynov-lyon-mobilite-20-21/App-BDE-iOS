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
        GeometryReader { gr in
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue)
                    .overlay(
                        VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text(event.name ?? "")
                                        .font(.largeTitle)
                                        .padding(.bottom, gr.size.height * 0.005)
                                    Text(event.type ?? "")
                                        .font(.subheadline)
                                }
                                .padding(.top, gr.size.height * 0.09)
                                .padding(.trailing, gr.size.width * 0.05)
                            
//                                .offset(x: -20, y: 50)
                            Spacer()
                            Text(event.date ?? "")
                                .font(.title3)
                                .padding(.bottom, 30)
                            })
                
            }
            
        }
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré description", price: 5))
    }
}
