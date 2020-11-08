//
//  InjectedObservedObject.swift
//  FYD
//
//  Created by Maxence on 29/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation
import SwiftUI

@propertyWrapper
struct InjectedObservedObject<T: ObservableObject>: DynamicProperty {
    @ObservedObject private var value: T
    
    var wrappedValue: T { value }
    
    var projectedValue: ObservedObject<T>.Wrapper {
        get { $value }
    }
    
    init(){
        let resolvedValue = DependencyProvider.shared.resolve(T.self)!
        self._value = ObservedObject<T>(initialValue: resolvedValue)
    }
    
    init<Argument>(argument: Argument) {
        let resolvedValue = DependencyProvider.shared.resolve(T.self, argument: argument)!
        self._value = ObservedObject<T>(initialValue: resolvedValue)
    }
}
