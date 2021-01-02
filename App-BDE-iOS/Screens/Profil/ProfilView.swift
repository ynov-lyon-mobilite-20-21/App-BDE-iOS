//
//  ProfilView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct ProfilView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isConnected = false
    @State private var showModal: Bool = false
    private var keyChain = KeyChain()
    
    var body: some View {
        GeometryReader { gr in
            ScrollView {
                VStack {
                    HStack {
                        ZStack {
                            VStack {
                                Spacer()
                                TitleCustom(textColor: .white, shadowColor: .bdeGreen, size: 35, title: "MON COMPTE")
                            }
                            .frame(minWidth: 0, maxWidth: gr.size.width - 35, minHeight: gr.size.height * 0.2, maxHeight: gr.size.height * 0.2)
                            .background(Color.blueToBlack)
                            .clipShape(ProfilTopShape())
                            Spacer()
                        }
                        Button("Connexion") {
                            self.isConnected = true
                        }
                        .alert(isPresented: $isConnected) {
                            Alert(title: Text("Vous n'êtes pas connecté"), primaryButton: Alert.Button.default(Text("Se ®connecter")){
                                self.showModal.toggle()
                            }

                            , secondaryButton: .cancel())
                        }
                        .sheet(isPresented: self.$showModal) { SignInView() }
                        
                        Spacer()
                    }
                    HStack {
                        Image("hugo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay(ZStack{
                                Circle().stroke(Color.bdeGreen, lineWidth: 2)
                                    .offset(x: 4, y: 1)
                                Circle().stroke(Color.pinkToYellow, lineWidth: 2)
                                    .offset(x: -6, y: -6)
                            })
                        VStack{
                            TitleCustom(textColor: .blackToWhite, shadowColor: .greenToYellow, size: 25, title: "Nicolas Barbosa")
                            Text("\nM1 Expert Dev WEB")
                                .font(.custom("FashionFetish", size: 12))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blackToWhite)
                                .padding(.leading)
                                .offset(x: 0, y: -20)
                        }
                    }
                    .frame(minHeight: 0, maxHeight: gr.size.height * 0.2)
                    .padding(.leading, 30)
                    HStack {
                        UserInfoView(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: 22, userAdress: "nicolas@test.com", userPhoneNumber: "07 86 35 62 13", userInscription: "Adhérent", lineWidth: gr.size.width * 0.8)
                        Spacer()
                    }
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

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfilView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
            
            ProfilView()
                .previewDevice("iPhone 8")
        }
    }
}
