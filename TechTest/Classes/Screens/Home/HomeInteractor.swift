//
//  HomeInteractor.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation
internal final class HomeInteractor {
    // MARK: Variables

    private let homeService: HomeServiceProtocol

    // MARK: inits

    init(homeService: HomeServiceProtocol = HomeService()) {
        self.homeService = homeService
    }
}

extension HomeInteractor: HomeInteractorProtocol {
    func getPeopleResult(firstURL: String, completion: @escaping (Result<[PeopleAPIProtocol], Error>) -> Void) {
        let dataService = homeService.getDataService()

        dataService.getPeopleResult { result in
            completion(result)
        }
    }
}
