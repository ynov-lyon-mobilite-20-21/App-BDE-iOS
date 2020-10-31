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
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.blue.opacity(0.85), location: 0),
                        .init(color: Color.white.opacity(1), location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .overlay(
                    VStack() {
                        Spacer()
                        VStack() {
                            Spacer()

                            HStack {
                                VStack(alignment: .leading) {
                                        Text(event.type ?? "")
                                            .font(.headline).foregroundColor(.secondary)
                                        Text(event.name ?? "")
                                            .font(.title2).bold()
                                        Text(event.description ?? "")
                                            .font(.body).foregroundColor(.primary).bold()
                                            .frame(minHeight: 0, maxHeight: .infinity)

                                }
                                Spacer()
                            }.padding(.horizontal)
                        }
                        .background(Color.white)
                        .frame(height: 150)
                    }

                )
        }.cornerRadius(30)
        
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5))
    }
}
