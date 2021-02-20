//
//  StringExtensions.swift
//  FYD
//
//  Created by Maxence Mottard on 31/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

extension String {
    func emailValidation() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
