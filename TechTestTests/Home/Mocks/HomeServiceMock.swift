//
//  HomeServiceMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest
import UIKit

class HomeServiceMock: HomeServiceProtocol {
    var getPeopleWasCalled = false

    func getDataService() -> TechTest.PeopleServiceAPIProtocol {
        getPeopleWasCalled = true
        return PeopleServiceAPIMock()
    }
}
