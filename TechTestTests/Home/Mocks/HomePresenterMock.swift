//
//  HomePresenterMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

class HomePresenterMock: HomePresenterProtocol {
    var view: TechTest.HomeViewProtocol?

    var funcViewDidLoadWasCalledCalled = false
    var funcViewAppearWasCalledCalled = false
    var funcEpisodeAtIndexWasCalled = false
    var callCharacterAPIWasCalled = false
    var downloadCharacterImageHomeWasCalled = false
    var funcGetPeopleCountWasCalled = false

    func viewDidLoadWasCalled() {
        funcViewDidLoadWasCalledCalled = true
    }

    func viewWillAppearWasCalled() {
        funcViewAppearWasCalledCalled = true
    }

    func checkNextCallIsNeeded() -> Bool {
        return TestConstants.testBool
    }

    func getPeopleCount() -> Int {
        funcGetPeopleCountWasCalled = true
        return TestConstants.testArrayPeople.count
    }

    func rmCharacterAtIndex(index: Int) -> TechTest.PeopleAPIProtocol {
        funcEpisodeAtIndexWasCalled = true
        return TestConstants.testArrayPeople[index]
    }

    func callCharacterAPI() {
        return callCharacterAPIWasCalled = true
    }

    func downloadCharacterImageHome(_ rmCharacterAtIndex: TechTest.PeopleAPIProtocol,
                                    _ cell: TechTest.HomeCustomCellView) {
        return downloadCharacterImageHomeWasCalled = true
    }
}
