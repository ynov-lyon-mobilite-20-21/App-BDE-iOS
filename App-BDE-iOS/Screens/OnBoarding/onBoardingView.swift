//
//  onBoarding.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/10/2020.
//

import SwiftUI

struct onBoardingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Image("onBoardingPage2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 40)
            
            Text("Achète ta place facilement et ne rate aucun évènement")
                .font(.system(size: 40)).bold()
            
            
            Text("Grâce à cette app, tu peux stocker tous tes billets au même endroit, les retrouver rapidement et les faire scanner par l'équipe du BDE le jour J !Grâce à cette app, tu peux stocker tous tes billets au même endroit, les retrouver rapidement et les faire scanner par l'équipe du BDE le jour J !")
            
            Spacer()
        }
        .background(Color.whiteToBlue)
        .ignoresSafeArea()
    }
}

struct onBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            onBoardingView()
            onBoardingView()
                .preferredColorScheme(.dark)
        }
    }
}
