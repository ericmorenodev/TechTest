//
//  PeopleServiceAPITest.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

@testable import TechTest
import Foundation
import XCTest

final class PeopleServiceApiTests: XCTestCase {
    var sut: PeopleServiceAPI!
    var apiManagerMock: APIManagerMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        apiManagerMock = APIManagerMock()
        sut = PeopleServiceAPI(apiManager: apiManagerMock)
    }

    func releaseSut() {
        sut = nil
    }

    func testSutNotNil() {
        // comprueba que se ha creado bien la clase
        XCTAssertNotNil(sut)
    }

    func testGetPeopleWasCalledCalled() {
        sut.getPeopleResult(firstURL: "") { (_: Result<PeopleResponseAPIProtocol, Error>) in
            XCTAssertTrue(self.apiManagerMock.apiCallWasCalled)
            XCTAssertFalse(self.apiManagerMock.showErrorCalled)
            XCTAssertTrue(self.apiManagerMock.showErrorNotCalled)
        }
    }

    func testGetPeopleError() {
        apiManagerMock.showError = true

        sut.getPeopleResult(firstURL: "") { (_: Result<PeopleResponseAPIProtocol, Error>) in
            XCTAssertTrue(self.apiManagerMock.apiCallWasCalled)
            XCTAssertTrue(self.apiManagerMock.showErrorCalled)
            XCTAssertFalse(self.apiManagerMock.showErrorNotCalled)
        }
    }
}
