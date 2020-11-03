//
//  UserInfoItem.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct UserInfoItem: View {
    let textColor: Color
    let shadowColor: Color
    let size: CGFloat
    let title: String
    let lineWidth: CGFloat
    let userInfo: String
    var body: some View {
        VStack(alignment: .leading, spacing: -6) {
            VStack(alignment: .leading, spacing: -6){
                TitleWithoutPaddingCustom(textColor: textColor, shadowColor: shadowColor, size: size, title: title)
                Text("\n\(userInfo)")
                    .font(.custom("FashionFetish", size: size - 8))
                    .foregroundColor(.blackToWhite)
            }
            .padding(.leading, 50)

            
            LineShape()
                .stroke(Color.blackToWhite, lineWidth: 2)
                .opacity(0.15)
                .frame(width: lineWidth ,height: 2)
                .padding(.top)
        }
    }
}

struct UserInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoItem(textColor: .black, shadowColor: .green, size: 30, title: "ADRESSE E-MAIL", lineWidth: 2, userInfo: "nicolas.barbosa@orange.fr")
    }
}
