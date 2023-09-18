//
//  PeopleSerivceAPI.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
public class PeopleServiceAPI: PeopleServiceAPIProtocol {
    var apiManager: APIManagerProtocol

    init(apiManager: APIManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }

    func getPeopleResult(firstURL: String, completion: @escaping (Result<PeopleResponseAPIProtocol, Error>) -> Void) {
        apiManager.apiCall(for: firstURL) { (result: Result<PeopleResponseAPI, Error>) in
            switch result {
            case let .success(people):
                completion(.success(people))

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
