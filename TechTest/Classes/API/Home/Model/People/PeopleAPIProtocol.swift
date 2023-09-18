//
//  PeopleAPIProtocol.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation

protocol PeopleAPIProtocol {
    var characterId: Int { get }
    var name: String { get }
    var status: Status { get }
    var species: String { get }
    var type: String { get }
    var gender: Gender { get }
    var origin: Origin { get }
    var location: LocationOfCharacter { get }
    var image: String { get }
    var episodes: [URL] { get }
    var characterURL: URL { get }
    var created: String { get }
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown
}

protocol Origin {
    var name: String { get }
    var url: String { get }
}

protocol LocationOfCharacter {
    var name: String { get }
    var url: String { get }
}
