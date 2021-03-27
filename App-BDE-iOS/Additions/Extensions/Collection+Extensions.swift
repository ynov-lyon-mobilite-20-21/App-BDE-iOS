//
//  Collection+.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/03/2021.
//

import Foundation

extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
