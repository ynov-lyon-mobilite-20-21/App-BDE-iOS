//
//  ProfilView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        GeometryReader { gr in
            VStack {
                HStack {
                    ZStack {
                        VStack {
                            Spacer()
                            TitleCustom(textColor: .white, shadowColor: .green, size: 25, title: "MON COMPTE")
                        }
                        .frame(minWidth: 0, maxWidth: gr.size.width - 35, minHeight: 180, maxHeight: 180)
                        .background(Color.blueToBlack)
                        .clipShape(ProfilTopShape())
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Circle()
                    Text("test")
                }
            } 
        }
        .background(Color.whiteToBlue)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfilView()
            ProfilView()
                .previewDevice("iPhone 8")
        }
    }
}
