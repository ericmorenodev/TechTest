//
//  PeopleSerivceAPI.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
public class PeopleServiceAPI: PeopleServiceAPIProtocol {
    private var nextPageCharacters: String?

    func getPeopleResult(completion: @escaping (Result<[PeopleAPIProtocol], Error>) -> Void) {
        let firstUrl = ConstantsAPI.apiCharacter

        var nextUrlToCall = firstUrl

        if let nextPageUrl = nextPageCharacters {
            nextUrlToCall = nextPageUrl
        }

        guard let url = URL(string: nextUrlToCall) else {
            return
        }

        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            if let data {
                do {
                    let apiResults = try JSONDecoder().decode(PeopleResponseAPI.self,
                                                              from: data)
                    self.nextPageCharacters = apiResults.info.next
                    completion(.success(apiResults.results))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
