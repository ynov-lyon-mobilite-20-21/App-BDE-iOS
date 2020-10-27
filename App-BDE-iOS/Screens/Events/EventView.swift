//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    let eventitem: Event = Event(id: 1, name: "Espit Chupitos", type: EventViewModel.eventType.party, image: "", date: "22/12/2020", address: "", description: "", price: 0)

    var body: some View {
        ZStack {
            GeometryReader { gr in
                VStack {
                    Spacer()
                    Text("Evenements").font(.custom("Fashion Fetish Regular", size: 30))
                    Spacer()
                    EventItem(event: eventitem)
                        .frame(width: gr.size.width * 0.7, height: gr.size.height * 0.6)
                    Spacer()
                }
            }
        }.background(Image("background_event")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top))
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}

