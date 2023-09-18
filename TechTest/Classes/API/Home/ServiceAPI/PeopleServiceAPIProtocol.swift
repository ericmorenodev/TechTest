//
//  PeopleServiceAPIProtocol.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
protocol PeopleServiceAPIProtocol {
    func getPeopleResult(firstURL: String, completion: @escaping (Result<PeopleResponseAPIProtocol, Error>) -> Void)
}
