//
//  UserDefaultsPropertyWrapper.swift
//  FYD
//
//  Created by Maxence Mottard on 31/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation

@propertyWrapper struct UserDefaultsBacked<Value> {
    let key: String
    var storage: UserDefaults = .standard

    var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set { storage.setValue(newValue, forKey: key) }
    }
}
