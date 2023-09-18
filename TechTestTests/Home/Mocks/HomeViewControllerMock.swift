//
//  HomeViewControllerMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

class HomeViewMock: HomeViewProtocol {
    var funcLoadPeople = false
    var funcloadingViewCalled = false
    var funcShowErrorWasCalled = false

    func reloadPeople() {
        funcLoadPeople = true
    }

    func loadingView(_ state: TechTest.LoadingState) {
        funcloadingViewCalled = true
    }

    func showError(title: String, message: String) {
        funcShowErrorWasCalled = true
    }
}
