//
//  EventViewModel_spec.swift
//  App-BDE-iOSTests
//
//  Created by Nicolas Barbosa on 26/03/2021.
//

import Foundation
import XCTest
@testable import App_BDE_iOS

class EventViewModel_spec: XCTestCase {
    
    func test_EventViewModel_is_created() {
        let vm = EventViewModel()
        XCTAssertNotNil(vm, "View Model should not be nil")
    }
}
