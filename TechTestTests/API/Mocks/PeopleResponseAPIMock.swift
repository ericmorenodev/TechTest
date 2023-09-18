//
//  PeopleResponseAPIMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

struct PeopleResponseAPIMock: PeopleResponseAPIProtocol {
    var info: RMInfoProtocol
    var results: [PeopleAPIProtocol]

    init(info: RMInfoProtocol, results: [PeopleAPIProtocol]) {
        self.info = info
        self.results = results
    }
}
