//
//  HomeDelegateMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest
import UIKit

class HomeDelegateMock: HomeCoordinatorDelegate {
    var goToDeatailScreenCalled = false

    func goToDetailScreen(people: TechTest.PeopleAPIProtocol, sender: UIViewController) {
        goToDeatailScreenCalled = true
    }
}
