//
//  BottonTabView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct BottonTabView: View {
    
    @ObservedObject var viewRouter = ViewRouter()
    @State private var showModal = false

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.viewRouter.currentView == "Event" {
                    EventView()
                } else if self.viewRouter.currentView == "Profil" {
                    ProfilView()
                }
                
                VStack {
                    
                    Spacer()
                    HStack {
                        VStack {
                            Image(self.viewRouter.currentView == "Event" ? "ticket-noir-outline" : "ticket-gris-outline")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                .frame(width: geometry.size.width/3, height: 75)
                                .onTapGesture {
                                    self.viewRouter.currentView = "Event"
                                }
                            Text("ÉVÉNEMENTS")
                                .font(.custom(self.viewRouter.currentView == "Event" ? "Fashion Fetish Bold" : "Fashion Fetish Regular", size: 12))
                                .offset(y: -25)
                        }
                        
                        
                        
                        ZStack {
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 100, height: 100)
                                .shadow(radius: 6 )
                            Image("logo_bde")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                        }.offset(y: -geometry.size.height/10/2)
                        .onTapGesture {
                            self.showModal = true
                        }.sheet(isPresented: $showModal, onDismiss: {
                            self.showModal = false
                        }) {
                            ContactsView()
                        }
                        
                        
                        VStack {
                            Image(self.viewRouter.currentView == "Profil" ? "user-noir-outline" : "user-gris-outline")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                .frame(width: geometry.size.width/3, height: 75)
                                .onTapGesture {
                                    self.viewRouter.currentView = "Profil"
                                }
                            Text("PROFIL")
                                .font(.custom(self.viewRouter.currentView == "Profil" ? "Fashion Fetish Bold" : "Fashion Fetish Regular", size: 12))
                                .offset(y: -25)
                        }
                        
                        
                        
                        
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                    .background(
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    )
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BottonTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BottonTabView()
            BottonTabView()
                .previewDevice("iPhone SE (2nd generation)")
            BottonTabView()
                .previewDevice("iPhone 8")
            BottonTabView()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
}


//func isActuallyShow<T>(_ screenName: T, _ isIfItIs: T, _ isIfItNot: T) -> T{
//    return self.viewRouter.currentView == screenName ? isIfItIs : isIfItNot
//}

