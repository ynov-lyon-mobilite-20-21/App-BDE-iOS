//
//  LoadingState.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/12/2020.
//

import Foundation

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
