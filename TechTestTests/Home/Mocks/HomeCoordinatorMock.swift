//
//  HomeCoordinatorMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest
import UIKit

class HomeCoordinatorMock: HomeCoordinatorDelegate {
    var funGoToDetailScreenCalled = false
    func goToDetailScreen(people: TechTest.PeopleAPIProtocol, sender: UIViewController) {
        funGoToDetailScreenCalled = true
    }
}
