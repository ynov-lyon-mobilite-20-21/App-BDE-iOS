//
//  UserViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 31/12/2020.
//

import Foundation
import SwiftUI
import Combine

class UserViewModel: ObservableObject {

    @Published var user = User(mail: "", firstName: "", lastName: "", promotion: .defaultValue, formation: .defaultValue, isAdmin: false, isAdherent: false, isActive: false)
}
