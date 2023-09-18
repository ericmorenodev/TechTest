//
//  HomeInteractorTests.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import XCTest
@testable import TechTest

class HomeInteractorTests: XCTestCase {
    var sut: HomeInteractor!
    var serviceMock: HomeServiceMock!
    var presenterMock: HomePresenterMock!
    override func setUp() {
        super.setUp()

        createSut()
    }

    func createSut() {
        serviceMock = HomeServiceMock()
        presenterMock = HomePresenterMock()
        sut = HomeInteractor(homeService: serviceMock)
    }

    override func tearDown() {
        super.tearDown()

        releaseSut()
    }

    func releaseSut() {
        serviceMock = nil
        presenterMock = nil
        sut = nil
    }

    func testGetPeopleResult() {
        let expected = true
        sut.getPeopleResult(firstURL: "") { (_: Result<PeopleResponseAPIProtocol, Error>) in
            XCTAssertEqual(self.serviceMock.getPeopleWasCalled, expected)
        }
    }
}
