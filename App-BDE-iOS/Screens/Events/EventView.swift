//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    let eventList: [Event] = [Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5), Event(id: 1, name: "Au bal masquée", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré description", price: 5)]
    
    @Environment(\.colorScheme) var colorScheme
    
    @Namespace var nSpace
    @State private var hero: Bool = false
    @State private var selectedEvent: Event = Event()
    
    var body: some View {
        
        GeometryReader { gr in
            
            if hero {
                VStack {
                        EventItem(event: selectedEvent)
                }                            .onTapGesture {
                    withAnimation(.easeInOut(duration: 2.0)) { self.hero.toggle() }
                }
                .matchedGeometryEffect(id: "test1", in: nSpace)
            }
            
            if !hero {
                VStack(alignment: .leading){
                    
                    Spacer()
                    ZStack {
                        TitleShape(radius: 20)
                            .fill(Color.blueToBlack)
                        TitleCustom(textColor: .white, shadowColor: .bdeGreen, size: 30, title: "EVENEMENT")
                    }
                    .frame(width: 250, height: 40)
                    .shadow(radius: 6)
                    .offset(x: 0, y: -20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(eventList, id: \.self) { event in
                                EventItem(event: event)
                                    .frame(width: gr.size.width * 0.75)
                                    .onTapGesture {
                                        withAnimation(.easeOut(duration: 2.0)) { self.hero.toggle() }
                                        self.selectedEvent = event
                                    }
                            }
                        }
                        .padding(.horizontal, 50)
                    }
                    .frame(height: gr.size.height * 0.6)
                    .shadow(radius: 6)
                    
                    //                HStack(spacing: 12){
                    //
                    //                    ForEach(0..<self.eventList.count,id: \.self){i in
                    //
                    //                        Circle()
                    //                            .fill(self.index == i ? Color.gray : Color.black.opacity(0.07))
                    //                            .frame(width: 10, height: 10)
                    //                    }
                    //                }
                    //                .padding(.top,30)
                    Spacer()
                    
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
                
            })
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            EventView()
                .previewDevice("iPhone 8")
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
        }
    }
}
