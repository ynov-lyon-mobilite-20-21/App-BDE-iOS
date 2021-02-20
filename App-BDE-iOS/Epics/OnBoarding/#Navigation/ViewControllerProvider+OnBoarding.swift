//
//  ViewControllerProvider+OnBoarding.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 23/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func onBoarding() -> onBoardingView {
        let assembler = generateAssembler(viewControllerAssembly: OnBoardingAssembly())
        
        return assembler.resolver.resolve(onBoardingView.self)!
    }
}
