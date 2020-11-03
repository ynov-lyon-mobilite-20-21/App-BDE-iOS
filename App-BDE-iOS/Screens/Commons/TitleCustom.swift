//
//  TitleCustom.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct TitleCustom: View {
    let textColor: Color
    let shadowColor: Color
    let size: CGFloat
    let title: String
    var body: some View {
        ZStack {
            Text("\n" + title)
                .font(.custom("TabacBigSans-SemiBoldIt", size: size))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(shadowColor)
                .padding()
                .offset(x: 2, y: 2)
            
            Text("\n" + title)
                .font(.custom("TabacBigSans-SemiBoldIt", size: size))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(textColor)
                .padding()
        }
    }
}

struct TitleCustom_Previews: PreviewProvider {
    static var previews: some View {
        TitleCustom(textColor: .black, shadowColor: .green, size: 50, title: "test")
    }
}
