//
//  APIManagerMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

class APIManagerMock: APIManagerProtocol {
    var showError = false
    var apiCallWasCalled = false
    var showErrorCalled = false
    var showErrorNotCalled = false

    func apiCall<T>(for url: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        apiCallWasCalled = true

        if showError {
            showErrorCalled = true
            completion(.failure(TestConstants.errorTest))
        }
    }
}
