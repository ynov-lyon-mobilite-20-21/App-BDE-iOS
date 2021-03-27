//
//  ViewError.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 17/02/2021.
//

import Foundation

struct ViewError: Error, Identifiable {
    let errorCode: ErrorCode
    var id: String { errorCode.rawValue }

    var title: String {  NSLocalizedString("error.alert.\(errorCode).title", comment: "") }
    var description: String {  NSLocalizedString("error.alert.\(errorCode).description", comment: "") }

    enum ErrorCode: String {
        case UNKNOW_ERROR
        case PARTY_REFUSED
    }
}
