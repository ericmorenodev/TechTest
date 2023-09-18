//
//  PeopleServiceAPIMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

class PeopleServiceAPIMock: PeopleServiceAPIProtocol {
    func getPeopleResult(firstURL: String,
                         completion: @escaping (Result<TechTest.PeopleResponseAPIProtocol, Error>) -> Void) {
        completion(.success(TestConstants.testResponsePeople))
    }
}
