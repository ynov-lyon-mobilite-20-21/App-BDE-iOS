//
//  OnBoardingCardView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/01/2021.
//

import SwiftUI

struct OnBoardingCardView: View {

    var imageName: String
    var imageSupp: String
    var title: String
    var content: String

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                if imageSupp != "" {
                    Image(imageSupp)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .colorInvert().colorMultiply(.blueToWhite)
                        .offset(x: 4.5, y: -45)
                }
            }

            VStack(alignment: .leading, spacing: 20) {
                Text(title)
                    .font(.system(size: 35)).bold()
                    .foregroundColor(Color.blueToWhite)
                    .fixedSize(horizontal: false, vertical: true)
                Text(content)
                    .foregroundColor(Color.blackToWhite).fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, 30)
            }
            .padding(.horizontal)
            .padding(.top, 30)

        }
        .offset(y: -35)
        .background(Color.whiteToBlue)
        .ignoresSafeArea()
    }
}

struct OnBoardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingCardView(imageName: "onboarding_2",
                           imageSupp: "logos_illustration2",
                           title: "Achète ta place facilement et ne rate aucun évènement",
                           content: "Grâce à cette app, tu peux stocker tous tes billets au même endroit, les retrouver rapidement et les faire scanner par l'équipe du BDE le jour J !")
    }
}
