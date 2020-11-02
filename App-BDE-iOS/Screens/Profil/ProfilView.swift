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
                ZStack {
                    VStack {
                        Spacer()
                        Text("mon profil")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(minWidth: 0, maxWidth: gr.size.width - 35, minHeight: 180, maxHeight: 180)
                    .background(Color.blueToBlack)
                    .clipShape(ProfilTopShape())
                    Spacer()
                }
                Spacer()
            }
            
            .edgesIgnoringSafeArea(.top)
        }
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
