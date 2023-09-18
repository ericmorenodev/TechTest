//
//  PeopleResponseAPIProtocol.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
protocol PeopleResponseAPIProtocol {
    var info: RMInfoProtocol { get }
    var results: [PeopleAPIProtocol] { get }
}
