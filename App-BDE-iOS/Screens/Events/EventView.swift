//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    let eventList: [Event] = [Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré description", price: 5), Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré description", price: 5)]
    
    var body: some View {
        NavigationView {
            GeometryReader { gr in
                VStack{
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(eventList, id: \.self) { event in
                                EventItem(event: event)
                                    .frame(width: gr.size.width * 0.6)
                            }
                        }
                        .padding(.horizontal, 80)
                        .frame(height: gr.size.height * 0.6)
                    }
                    .offset(y: -30)

                    
                    Spacer()
                    
                }
            }
            .navigationBarTitle("Evenement")
            .background(Image("background_event")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top))
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventView()
            EventView()
                .previewDevice("iPhone 8")
        }
    }
}

