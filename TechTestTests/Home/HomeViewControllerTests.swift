//
//  HomeViewControllerTests.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import XCTest
@testable import TechTest

final class HomeViewControllerTests: XCTestCase {
    var sut: HomeViewController!
    var presenterMock: HomePresenterMock!
    var delegateMock: HomeDelegateMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        presenterMock = HomePresenterMock()

        delegateMock = HomeDelegateMock()
        sut = HomeViewController(presenter: presenterMock)

        sut.delegate = delegateMock
    }

    func releaseSut() {
        sut = nil
        presenterMock = nil
        delegateMock = nil
    }

    func testSutNotNil() {
        // comprueba que se ha creado bien la clase
        XCTAssertNotNil(sut)
        // se ha asignado bien el presenter
        XCTAssertNotNil(sut.presenter)
    }

    func testInitController() {
        _ = sut.view
        // estos test van viendo que las cosas pasan

        XCTAssertTrue(presenterMock.funcViewDidLoadWasCalledCalled)
        XCTAssertFalse(presenterMock.funcViewAppearWasCalledCalled)
    }

    func testTableView() {
        _ = sut.view
        let tableView = sut.tableViewPeople
        let numSut = sut.tableView(tableView!, numberOfRowsInSection: TestConstants.testInt)
        let numTest = presenterMock.getPeopleCount()

        XCTAssertEqual(numSut, numTest)
    }

    func testTableViewCellRowAt() {
        _ = sut.view
        let tableView = sut.tableViewPeople
        let cell = sut.tableView(tableView!, cellForRowAt: TestConstants.indexPath) as? HomeCustomCellView
        let expected = "test"

        XCTAssertEqual(cell?.lblName.text, expected)
    }

    func testTableViewRowAt() {
        _ = sut.view
        let tableView = sut.tableViewPeople

        sut.tableView(tableView!, didSelectRowAt: TestConstants.indexPath)
        XCTAssertTrue(delegateMock.goToDeatailScreenCalled)
    }

    func testWillDisplay() {
        _ = sut.view
        let tableView = sut.tableViewPeople

        sut.tableView(tableView!, willDisplay: TestConstants.testCell, forRowAt: TestConstants.indexPath)
        XCTAssertTrue(presenterMock.funcGetPeopleCountWasCalled)
    }
}
