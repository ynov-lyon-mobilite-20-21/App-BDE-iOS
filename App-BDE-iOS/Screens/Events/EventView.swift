//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    let eventList: [Event] = [Event(id: "1", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5), Event(id: "2", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5),Event(id: "3", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5), Event(id: "4", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5),Event(id: "5", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5), Event(id: "6", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5)]
    
    @Environment(\.colorScheme) var colorScheme
    var animation: Namespace.ID
    @EnvironmentObject var eventDetail : DetailViewModel

    var body: some View {
        
        ScrollView {
            HStack(alignment: .bottom) {
                ZStack {
                    TitleShape(radius: 20)
                        .fill(Color.blueToBlack)
                    TitleCustom(textColor: .white, shadowColor: .bdeGreen, size: 30, title: "EVENEMENT")
                }
                .frame(width: 250, height: 40)
                .shadow(radius: 6)
                
                Spacer()
            }
            
            ForEach(eventList, id: \.self) { event in
                
                if eventDetail.show {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 320)
                        .padding(.horizontal)
                        .padding(.top)
                } else {
                    
                    EventItem(event: event,animation: animation)
                        .padding(.horizontal)
                        .padding(.top)
                        .shadow(radius: 6)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                eventDetail.selectedItem = event
                                eventDetail.show.toggle()
                            }
                        }
                }
            }
        }
        .background(
            ZStack {
                Color.whiteToBlue
                Image("background_event")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(colorScheme == .dark ? 0.2 : 1)

            }.ignoresSafeArea())
    }
}
