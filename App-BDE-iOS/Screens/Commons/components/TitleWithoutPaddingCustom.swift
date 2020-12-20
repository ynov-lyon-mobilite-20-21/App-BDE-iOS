//
//  TitleWithoutPaddingCustom.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct TitleWithoutPaddingCustom: View {
    let textColor: Color
    let shadowColor: Color
    let size: CGFloat
    let title: String
    var body: some View {
        VStack {
            ZStack {
                Text("\n" + title)
                    .font(.custom("TabacBigSans-SemiBoldIt", size: size))
                    .foregroundColor(shadowColor)
                    .offset(x: 2, y: 2)
                
                Text("\n" + title)
                    .font(.custom("TabacBigSans-SemiBoldIt", size: size))
                    .foregroundColor(textColor)
            }
        }
    }
}

struct TitleWithoutPaddingCustom_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithoutPaddingCustom(textColor: .black, shadowColor: .greenToYellow, size: 40, title: "ADRESSE E-MAIL")
    }
}
