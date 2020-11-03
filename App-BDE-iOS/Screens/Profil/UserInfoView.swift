//
//  UserInfoView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct UserInfoView: View {
    let textColor: Color
    let shadowColor: Color
    let size: CGFloat
    let userAdress: String
    let userPhoneNumber: String
    let userInscription: String
    let lineWidth: CGFloat
    var body: some View {
        VStack(alignment: .leading) {
                UserInfoItem(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: size, title: "ADRESSE E-MAIL", lineWidth: lineWidth, userInfo: userAdress)
            
            UserInfoItem(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: size, title: "TELEPHONE", lineWidth: lineWidth, userInfo: userPhoneNumber)
            
            UserInfoItem(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: size, title: "STATUT", lineWidth: lineWidth, userInfo: userInscription)
            
               
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(textColor: .blackToWhite, shadowColor: .pinkToGreen, size: 15, userAdress: "nicolas@test.com", userPhoneNumber: "07 86 35 62 13", userInscription: "Adhérent", lineWidth: 2)
    }
}
