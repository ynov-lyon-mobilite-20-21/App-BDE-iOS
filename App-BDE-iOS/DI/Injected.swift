//
//  Inject.swift
//  FYD
//
//  Created by Maxence on 29/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

@propertyWrapper
struct Injected<T>{
    
    var value: T
    
    public var wrappedValue: T { value }
    
    init(){
        self.value = DependencyProvider.shared.resolve(T.self)!
    }
    
    init<Argument>(argument: Argument) {
        self.value = DependencyProvider.shared.resolve(T.self, argument: argument)!
    }
}
