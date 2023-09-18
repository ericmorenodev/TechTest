//
//  StorageManager.swift
//  TechTest
//
//  Created by Eric Moreno on 12/9/23.
//

import Foundation
import UIKit

protocol StorageManagerProtocol {
    func saveObject<T: Encodable>(object: T, filename: String) throws
    func getObject<T: Decodable>(filename: String) throws -> T

    func getPeople() -> [PeopleAPIProtocol]?
    func savePeople(people: [PeopleAPIProtocol])

    func getCharacterImage(characterId: Int) -> UIImage?
    func saveCharacterImage(image: UIImage, characterId: Int)
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
        } catch let error {
            print("Error retrieving data from cache: \(error.localizedDescription)")
        }

        return nil
    }

    func savePeople(people: [PeopleAPIProtocol]) {
        guard let peopleObj = people as? [PeopleAPI] else {
            return
        }
        do {
            try saveObject(object: peopleObj, filename: "peopleCache.json")
        } catch let saveError {
            print("Error saving character to cache: \(saveError.localizedDescription)")
        }
    }

    func getCharacterImage(characterId: Int) -> UIImage? {
        do {
            let imageData: Data = try getObject(filename: "\(characterId)ImageCache.jpg")
            return UIImage(data: imageData)
        } catch let getError {
            print("Error retrieving character image from cache: \(getError.localizedDescription)")
            return nil
        }
    }

    func saveCharacterImage(image: UIImage, characterId: Int) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            do {
                try saveObject(object: imageData, filename: "\(characterId)ImageCache.jpg")
            } catch let saveError {
                print("Error saving character image to cache: \(saveError.localizedDescription)")
            }
        }
    }

    // MARK: Path Function

    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)

        return paths[0]
    }
}
