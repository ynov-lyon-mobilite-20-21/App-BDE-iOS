//
//  StringExtensions.swift
//  FYD
//
//  Created by Maxence Mottard on 31/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        let string = String(self.dropFirst(prefix.count + 1))
        return string
    }
}

extension String {
    func emailValidation() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func fromBase64() -> String? {
        var string = self
        
        if string.count % 4 != 0 {
            let padlen = 4 - string.count % 4
            string.append(contentsOf: repeatElement("=", count: padlen))
        }

        guard let data = Data(base64Encoded: string) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
