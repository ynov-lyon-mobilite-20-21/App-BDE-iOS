//
//  ProfilView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct ProfilView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        GeometryReader { gr in
            VStack {
                HStack {
                    ZStack {
                        VStack {
                            Spacer()
                            TitleCustom(textColor: .white, shadowColor: .green, size: 35, title: "MON COMPTE")
                        }
                        .frame(minWidth: 0, maxWidth: gr.size.width - 35, minHeight: gr.size.height * 0.2, maxHeight: gr.size.height * 0.2)
                        .background(Color.blueToBlack)
                        .clipShape(ProfilTopShape())
                        Spacer()
                    }
                    Spacer()
                }
                HStack {
                    Image("ticket-noir-outline")
                        .clipShape(Circle())
                        .overlay(ZStack{
                            Circle().stroke(Color.bdeGreen, lineWidth: 3)
                                .offset(x: 4, y: 1)
                            
                            Circle().stroke(Color.pinkToYellow, lineWidth: 3)
                                .offset(x: -8, y: -6)
                            

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
                .padding()
                UserInfoView(lineWidth: gr.size.width * 0.7)
                    .frame(height: gr.size.height * 0.2)
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
