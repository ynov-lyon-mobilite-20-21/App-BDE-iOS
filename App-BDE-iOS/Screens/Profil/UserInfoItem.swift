//
//  UserInfoItem.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct UserInfoItem: View {
    let lineWidth: CGFloat
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            TitleCustom(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: 15, title: "ADRESSE E-MAIL")
            Text("\n nicolas.barbosa@ynov.com")
                .font(.custom("FashionFetish", size: 12))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.blackToWhite)
                .padding(.leading)
                .offset(x: -5, y: -25)
        }
        LineShape()
            .stroke(Color.blackToWhite, lineWidth: 2)
            .frame(width: lineWidth ,height: 2)
            .offset(x: 0, y: -15)
        Spacer()
    }
}

struct UserInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoItem(lineWidth: 200)
    }
}
