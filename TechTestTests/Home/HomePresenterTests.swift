//
//  HomePresenterTests.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import XCTest
@testable import TechTest

class HomePresenterTests: XCTestCase {
    var sut: HomePresenter!
    var interactorMock: HomeInteractorMock!
    var viewMock: HomeViewMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        interactorMock = HomeInteractorMock()
        viewMock = HomeViewMock()
        sut = HomePresenter(interactor: interactorMock)

        sut.view = viewMock
    }

    func releaseSut() {
        sut = nil
        interactorMock = nil
        viewMock = nil
    }

    func testSutNotNil() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.interactor)
    }

    func testGetPeopleSuccess() {
        _ = sut.view
        sut.callCharacterAPI()
        XCTAssertTrue(interactorMock.funcGetDataWasCalled)
    }

    func testGetPeopleFailure() {
        _ = sut.view
        sut.callCharacterAPI()
        XCTAssertTrue(interactorMock.funcGetDataWasCalled)
    }

    func testGetPeopleCount() {
        sut.callCharacterAPI()
        let count = sut.getPeopleCount()
        let expected = 1

        XCTAssertEqual(count, expected)
    }

    func testPeopleAtIndex() {
        sut.rmCharacter = TestConstants.testArrayPeople
        let result = sut.rmCharacterAtIndex(index: 0)
        XCTAssertNotNil(result)
        XCTAssertEqual(result.characterId, TestConstants.testArrayPeople[0].characterId)
        XCTAssertEqual(result.name, TestConstants.testArrayPeople[0].name)
    }
}
