//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    let eventList: [Event] = [Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5), Event(id: 1, name: "Espit Chupitos", type: "Soirée Etudiante", image: "blabla", date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré description", price: 5)]
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
            GeometryReader { gr in
                VStack{
                    VStack {
                        Spacer()
                        TitleCustom(textColor: .blackToWhite, shadowColor: .bdeGreen, size: 35, title: "EVENEMENT")
                            .padding(.leading, 45)
                    }
                    .frame(height: gr.size.height * 0.2)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(eventList, id: \.self) { event in
                                EventItem(event: event)
                                    .frame(width: gr.size.width * 0.75)
                            }
                        }
                        .padding(.horizontal, 50)
                    }
                    .frame(height: gr.size.height * 0.6)
                    .shadow(radius: 6)
                    
                    Button(action: {
                        print("Delete button tapped!")
                    }) {
                        Text("Voir l'évènement")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color.bdeBlue)
                            .cornerRadius(30)
                    }
                    .padding()
                    .shadow(radius: 6 )
                    
                    Spacer()
                    
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
        }
    }
}

