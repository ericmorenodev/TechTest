//
//  PeopleServiceAPIProtocol.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
protocol PeopleServiceAPIProtocol {
    func getPeopleResult(completion: @escaping (Result<[PeopleAPIProtocol], Error>) -> Void)
}
