//
//  StorageManager.swift
//  TechTest
//
//  Created by Eric Moreno on 12/9/23.
//

import Foundation

protocol StorageManagerProtocol {
    func saveObject<T: Encodable>(object: T, filename: String) throws
    func getObject<T: Decodable>(filename: String) throws -> T

    func getPeople() -> [PeopleAPIProtocol]?
    func savePeople(people: [PeopleAPIProtocol])
}

struct StorageManager: StorageManagerProtocol {
    // MARK: Abstracted Storage

    static let shared = StorageManager()

    func saveObject<T: Encodable>(object: T, filename: String) throws {
        let objectData = try JSONEncoder().encode(object)

        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent(filename,
                                                                isDirectory: false)
        try objectData.write(to: storageURL)
    }

    func getObject<T: Decodable>(filename: String) throws -> T {
        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent(filename,
                                                                isDirectory: false)

        let objectData = try Data(contentsOf: storageURL)
        let object = try JSONDecoder().decode(T.self, from: objectData)

        return object
    }

    // MARK: Object Storage

    func getPeople() -> [PeopleAPIProtocol]? {
        do {
            let people: [PeopleAPI] = try getObject(filename: "peopleCache.json")
            return people
        } catch let err { // esto visual si quieres
            print(err.localizedDescription)
        }

        return nil
    }

    func savePeople(people: [PeopleAPIProtocol]) {
        guard let peopleObj = people as? [PeopleAPI] else {
            return
        }

        try? saveObject(object: peopleObj, filename: "peopleCache.json")
    }

    // MARK: Path Function

    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)

        return paths[0]
    }
}
