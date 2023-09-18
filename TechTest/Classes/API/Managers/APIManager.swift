//
//  StorageManager.swift
//  TechTest
//
//  Created by Eric Moreno on 12/9/23.
//

import Foundation

protocol APIManagerProtocol {
    func apiCall<T: Decodable>(for url: String, completion: @escaping (Result<T, Error>) -> Void)
}

struct ApiManager: APIManagerProtocol {
    static let shared = ApiManager()

    func apiCall<T: Decodable>(for url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(
                .failure(
                    CustomError(title: "UrlError", description: "Url not found!", code: 1)
                )
            )
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
                    let object = try JSONDecoder()
                        .decode(T.self,
                                from: data)
                    completion(.success(object))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
