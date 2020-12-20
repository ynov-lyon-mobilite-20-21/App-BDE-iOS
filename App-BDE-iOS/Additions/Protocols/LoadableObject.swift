//
//  LoadableObject.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/12/2020.
//

import Foundation

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
