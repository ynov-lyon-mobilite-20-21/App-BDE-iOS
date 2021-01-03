//
//  onBoarding.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/10/2020.
//

import SwiftUI

struct onBoardingView: View {
    
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    @InjectedObservedObject private var onBoardingViewModel: OnBoardingViewModel
    
    var body: some View {
        if needsAppOnboarding == true {
            ZStack(alignment: .bottom) {
                Color.whiteToBlue
                    .ignoresSafeArea()

                TabView(selection: $onBoardingViewModel.selected) {
                    OnBoardingCardView(imageName: "onboarding_1", imageSupp: "", title: "Parcours les évènements à venir de ton BDE ", content: "Tout au long de l'année tu trouveras des évènements variés pour nous retrouver et passer de bons moments.").tag(0)
                    OnBoardingCardView(imageName: "onboarding_2", imageSupp: "logos_illustration2", title: "Achète ta place facilement et ne rate aucun évènement", content: "Grâce à cette app, tu peux stocker tous tes billets au même endroit, les retrouver rapidement et les faire scanner par l'équipe du BDE le jour J !").tag(1)
                    OnBoardingCardView(imageName: "onboarding_3", imageSupp: "", title: "Prends contact quand tu veux avec les membres de ton BDE ", content: "Des questions ? Des précisions ? Nous sommes à ta disposition pour t'éclairer et t'aider au mieux à passer des moments inoubliables avec nous !").tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                .animation(.easeIn)
                .ignoresSafeArea(edges: .top)

                HStack {
                    if onBoardingViewModel.selected != 0 {
                        Button("Retour", action: {
                            onBoardingViewModel.Previous()
                        })
                    }
                    Spacer()
                    Button("Suivant", action: {
                        onBoardingViewModel.Next()
                    })
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 15)
            }
        } else {
            MainView()
        }
    }
    
    struct onBoardingView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                onBoardingView()
                    .previewDevice("iPhone 8")
                onBoardingView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
