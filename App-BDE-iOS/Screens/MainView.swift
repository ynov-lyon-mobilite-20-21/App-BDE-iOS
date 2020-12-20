//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct MainView: View {
    
    @Namespace var animation
    @StateObject var eventViewModel = EventViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        ZStack{
            if eventViewModel.show{
                EventDetailView(vm: eventViewModel, animation: animation)
            }else {
                ZStack(alignment: .bottom) {
                    TabView {
                        EventView(animation: animation)
                            .environmentObject(eventViewModel)
                            .tabItem {
                                Image(systemName: "house")
                                Text("Event")
                            }
                        
                        ProfilView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Event")
                            }
                    }
                    .accentColor(.blackToWhite)
                    .opacity(eventViewModel.show ? 0 : 1)
                    
                    BottomTabBarModalItem() {
                        self.showModal.toggle()
                    }.offset(y: -8)
                }
            }
        }
        .sheet(isPresented: self.$showModal) { ContactsView() }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 11")
            MainView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
