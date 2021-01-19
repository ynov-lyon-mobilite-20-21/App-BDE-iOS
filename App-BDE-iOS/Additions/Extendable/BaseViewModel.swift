//
//  BaseViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 05/01/2021.
//

import Foundation
import Combine
import SwiftUI

class BaseViewModel: ObservableObject, Weakable {
    var bag = Set<AnyCancellable>()
    var error: CustomError?
    @State var errorAlertIsShown: Bool = false

    func executeRequest<T>(_ publisher: AnyPublisher<T, Error>, onSuccess: @escaping ((T) -> Void), onError: ((Error) -> Void)?) {
        publisher
            .sink(receiveCompletion: weakify { strongSelf, result in
                switch result {
                case .finished:
                    break;
                case .failure(let error as CustomError):
                    strongSelf.handleError(error: error)
                case .failure( _):
                    strongSelf.handleError(error: CustomError(errorBody: "UNKNOWN_ERROR"))
                }
                
            }, receiveValue: { value in
                print("received Value : \(value)")
                onSuccess(value)
            }).store(in: &bag)
    }

    func executeRequest<T>(_ publisher: AnyPublisher<T, Error>, onSuccess: @escaping ((T) -> Void)) {
        executeRequest(publisher, onSuccess: onSuccess, onError: nil)
    }

    private func handleError(error: CustomError) {
        self.error = error
        errorAlertIsShown = true
    }
}
