//
//  TitleCustom.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct TitleCustom: View {
    let title: String
    let font: Font
    let textColor: Color
    let shadowColor: Color
    var body: some View {
        ZStack {
            Text(title)
                .font(font)
                .foregroundColor(shadowColor)
                .offset(x: 2, y: 2)
            
            Text(title)
                .font(font)
                .foregroundColor(textColor)
        }
    }
}

struct TitleCustom_Previews: PreviewProvider {
    static var previews: some View {
        TitleCustom(title: "Test", font: .custom("TabacBigSans-SemiBoldIt", size: 15), textColor: Color.black, shadowColor: Color.bdeGreen)
    }
}
