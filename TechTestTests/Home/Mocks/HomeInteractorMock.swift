//
//  HomeInteractorMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import UIKit
@testable import TechTest

class HomeInteractorMock: HomeInteractorProtocol {
    var funcGetDataWasCalled = false
    var showError = false
    var showErrorCalled = false

    func getPeopleResult(firstURL: String,
                         completion: @escaping (Result<TechTest.PeopleResponseAPIProtocol, Error>) -> Void) {
        funcGetDataWasCalled = true
        if showError {
            showErrorCalled = true
            completion(.failure(TestConstants.errorTest))
        } else {
            showErrorCalled = false
            completion(.success(TestConstants.testResponsePeople))
        }
    }
}
