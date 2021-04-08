//
//  BaseViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 05/01/2021.
//

import Foundation
import Combine
import SwiftUI
import JWTDecode

class BaseViewModel: ObservableObject, Weakable {
    
    let objectWillChange = ObservableObjectPublisher()
    var bag = Set<AnyCancellable>()
    var error: ViewError?
    private let keyChainService = KeyChainService.shared
    
    var token: String? {
        let token = keyChainService.getStringInKeyChain(name: "UserToken")
        return token
    }
    
    var refreshToken: String? {
        return keyChainService.getStringInKeyChain(name: "UserRefreshToken")
    }
    
    var isAuthenticated: Bool {
        return (token != nil)
    }
    
    var isExpired: Bool {
        guard let token = token else { return true }
        do {
            let jwt = try decode(jwt: token)
            
            return jwt.expired
        } catch { return true }
    }
    
    func disconnect() {
        keyChainService.removeStringInKeyChain(name: "UserToken")
        keyChainService.removeStringInKeyChain(name: "UserRefreshToken")
        print(keyChainService.getStringInKeyChain(name: "UserToken"))
    }
    
    func getNewToken(onTokenSuccess: @escaping (String) -> Void) {
        let refreshTokenWebService = RefreshTokenWebService()
        
        guard let refreshToken = refreshToken else { return }
        
        let serviceParameter = ExecuteServiceSetup(service: refreshTokenWebService, parameters: RefreshTokenServiceParameter(refreshToken: refreshToken))
        executeRequest(serviceParameter, onSuccess: { value in
            KeyChainService.shared.addTokensInKeyChain(token: value.data.token, refreshToken: value.data.refreshToken)
            onTokenSuccess(value.data.token)
        })
    }
    func executeRequest<T: WebService>(_ serviceSetup: ExecuteServiceSetup<T>,
                                       onSuccess: @escaping ((GenericServerResponse<T.DecodedType>) -> Void),
                                       onError: ((ViewError) -> Void)? = nil) {
        let serviceExecution = weakify { strongSelf in
            serviceSetup.service
                .call(serviceSetup.parameters, urlParameters: serviceSetup.urlParameters)
                .sink(receiveCompletion: { result in
                    strongSelf.onReceiveCompletion(result: result, onError: onError)
                }, receiveValue: { value in
                    onSuccess(value)
                }).store(in: &strongSelf.bag)
        }
        executeTheRequest(serviceSetupParameter: serviceSetup, serviceExecution: serviceExecution)
    }
    func executeRequestWithoutDecode<T: WebService>(_ serviceSetup: ExecuteServiceSetup<T>, onSuccess: @escaping (() -> Void), onError: ((ViewError) -> Void)? = nil) {
        let serviceExecution = weakify { strongSelf in
            serviceSetup.service
                .callWithoutDecode(serviceSetup.parameters, urlParameters: serviceSetup.urlParameters)
                .sink(receiveCompletion: { result in
                    strongSelf.onReceiveCompletion(result: result, onError: onError)
                }, receiveValue: {
                    onSuccess()
                }).store(in: &strongSelf.bag)
        }
        executeTheRequest(serviceSetupParameter: serviceSetup, serviceExecution: serviceExecution)
    }
    
    func handleError(error: ViewError) {
        ErrorProvider.shared.handleError(error)
    }
    
    private func onReceiveCompletion(result: Subscribers.Completion<Error>, onError: ((ViewError) -> Void)?) {
        switch result {
        case .finished:
            break;
        case .failure(let error as ViewError):
            handleError(error: error)
            onError?(error)
        case .failure(let error):
            print(error)
            let customError = ViewError(errorCode: .UNKNOW_ERROR)
            handleError(error: customError)
            onError?(customError)
        }
    }
    
    private func executeTheRequest<T: WebService>(serviceSetupParameter: ExecuteServiceSetup<T>, serviceExecution: @escaping () -> Void) {
        if serviceSetupParameter.isRequestAuthenticated {
            guard let token = token else {
                handleError(error: ViewError(errorCode: .TOKEN_NOT_FOUND))
                return
            }
            
            if isExpired {
                getNewToken(onTokenSuccess: { token in
                    serviceSetupParameter.service.addHeader(key: "Authorization", value: "Bearer \(token)")
                    serviceExecution()
                })
            } else {
                serviceSetupParameter.service.addHeader(key: "Authorization", value: "Bearer \(token)")
                serviceExecution()
            }
        } else {
            serviceExecution()
        }
    }
    
    struct ExecuteServiceSetup<T: WebService> {
        let service: T
        let parameters: T.ServiceParameters
        let urlParameters: [String]
        let isRequestAuthenticated: Bool
        
        init(service: T, parameters: T.ServiceParameters, urlParameters: [String] = [], isRequestAuthenticated: Bool = false) {
            self.service = service
            self.parameters = parameters
            self.urlParameters = urlParameters
            self.isRequestAuthenticated = isRequestAuthenticated
        }
    }
}
