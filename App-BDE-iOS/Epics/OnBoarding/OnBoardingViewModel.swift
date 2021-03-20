//
//  OnBoardingViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/10/2020.
//

import Foundation
import SwiftUI

final class OnBoardingViewModel: BaseViewModel {

    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true

    var selected = 0 { didSet {
        objectWillChange.send()
    }}

    func Next() {
        if selected < 2 {
            selected+=1
        } else if selected == 2 {
            needsAppOnboarding = false
        }
    }

    func Previous() {
        if selected > 0 {
            selected-=1
        } else { return }
    }
}
