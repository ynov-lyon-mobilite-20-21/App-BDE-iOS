//
//  onBoarding.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/10/2020.
//

import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var viewModel: OnBoardingViewModel
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true

    var body: some View {
        if needsAppOnboarding == true {
            ZStack(alignment: .bottom) {
                Color.whiteToBlue
                    .ignoresSafeArea()

                TabView(selection: $viewModel.selected) {
                    OnBoardingCardView(imageName: "onboarding_1", imageSupp: "", title: L10n.OnBoarding.title1, content: L10n.OnBoarding.content1).tag(0)
                    OnBoardingCardView(imageName: "onboarding_2", imageSupp: "logos_illustration2", title: L10n.OnBoarding.title2, content: L10n.OnBoarding.content2).tag(1)
                    OnBoardingCardView(imageName: "onboarding_3", imageSupp: "", title: L10n.OnBoarding.title3, content: L10n.OnBoarding.content3).tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .animation(.easeIn)
                .ignoresSafeArea(edges: .top)

                HStack {
                    if viewModel.selected != 0 {
                        Button("Retour", action: {
                            viewModel.Previous()
                        })
                        .foregroundColor(Color.bdeGreen)
                    }
                    Spacer()
                    Button("Suivant", action: {
                        viewModel.Next()
                    })
                    .foregroundColor(Color.bdeGreen)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 15)
            }
        } else {
            ViewProvider.home()
        }
    }

    struct OnBoardingView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                OnBoardingView(viewModel: OnBoardingViewModel())
                    .previewDevice("iPhone 8")
                OnBoardingView(viewModel: OnBoardingViewModel())
                    .preferredColorScheme(.dark)
            }
        }
    }
}
