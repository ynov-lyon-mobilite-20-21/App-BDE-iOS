//
//  UserInfoView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct UserInfoView: View {
    let lineWidth: CGFloat
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TitleCustom(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: 15, title: "ADRESSE E-MAIL")
                Text("\n nicolas.barbosa@ynov.com")
                    .font(.custom("FashionFetish", size: 12))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blackToWhite)
                    .padding(.leading)
                    .offset(x: -5, y: -25)
                LineShape()
                    .stroke(Color.blackToWhite, lineWidth: 2)
                    .frame(width: lineWidth ,height: 2)
                    .offset(x: 0, y: -15)
            }

            VStack(alignment: .leading) {
                TitleCustom(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: 15, title: "TELEPHONE")
                Text("\n 07 86 35 62 13")
                    .font(.custom("FashionFetish", size: 12))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blackToWhite)
                    .padding(.leading)
                    .offset(x: -5, y: -25)
                LineShape()
                    .stroke(Color.blackToWhite, lineWidth: 2)
                    .frame(width: lineWidth ,height: 2)
                    .offset(x: 0, y: -15)
            }

            VStack(alignment: .leading) {
                TitleCustom(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: 15, title: "STATUT")
                Text("\n Adhérent")
                    .font(.custom("FashionFetish", size: 12))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blackToWhite)
                    .padding(.leading)
                    .offset(x: -5, y: -25)
                
                LineShape()
                    .stroke(Color.blackToWhite, lineWidth: 2)
                    .frame(width: lineWidth ,height: 2)
                    .offset(x: 0, y: -15)
            }
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(lineWidth: 50)
    }
}
