//
//  HomeService.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation
internal final class HomeService: HomeServiceProtocol {
    // MARK: Variables

    private let dataService: PeopleServiceAPIProtocol

    // MARK: Inits

    init(dataService: PeopleServiceAPIProtocol = PeopleServiceAPI()) {
        self.dataService = dataService
    }

    // MARK: Actions

    func getDataService() -> PeopleServiceAPIProtocol {
        return dataService
    }
}
