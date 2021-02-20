//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    let eventList: [Event] = [Event(id: "1", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5)]
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel : EventViewModel
    @State private var showModal: Bool = false



    var body: some View {
        
        ScrollView {
            HStack(alignment: .bottom) {
                ZStack {
                    TitleShape(radius: 20)
                        .fill(Color.blueToBlack)
                    TitleCustom(title: "EVENEMENT",  font: .custom("TabacBigSans-SemiBoldIt", size: 25), textColor: .white, shadowColor: .bdeGreen)
                }
                .frame(width: 250, height: 40)
                .shadow(radius: 6)
                
                Spacer()
            }
            
            ForEach(eventList, id: \.self) { event in
                
                    EventItem(event: event)
                        .padding(.horizontal)
                        .padding(.top)
                        .shadow(radius: 6)
                        .onTapGesture {
                            self.showModal = true
                        }
                        .sheet(isPresented: self.$showModal) { ViewProvider.eventDetail() }
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
