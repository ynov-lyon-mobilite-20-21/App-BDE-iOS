//
//  UIApplication.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 02/01/2021.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
