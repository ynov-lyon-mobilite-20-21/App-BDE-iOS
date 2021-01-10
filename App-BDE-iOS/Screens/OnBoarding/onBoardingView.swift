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
                    OnBoardingCardView(imageName: "onboarding_1", imageSupp: "", title: L10n.OnBoarding.title1, content: L10n.OnBoarding.content1).tag(0)
                    OnBoardingCardView(imageName: "onboarding_2", imageSupp: "logos_illustration2", title: L10n.OnBoarding.title2, content: L10n.OnBoarding.content2).tag(1)
                    OnBoardingCardView(imageName: "onboarding_3", imageSupp: "", title: L10n.OnBoarding.title3, content: L10n.OnBoarding.content3).tag(2)
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
