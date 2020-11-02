//
//  ProfilView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {

        VStack {
            HStack {
                HStack {
                    Text("mon profil")
                }
                .frame(minWidth: 0, maxWidth: 400, minHeight: 180, maxHeight: 180)
                .background(Color.blue)
                .clipShape(ProfilTopShape())
                Spacer()
            }
            Spacer()
        }
        
                    .edgesIgnoringSafeArea(.top)
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
