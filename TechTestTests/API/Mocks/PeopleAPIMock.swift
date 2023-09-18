//
//  PeopleAPIMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

struct PeopleApiMock: PeopleAPIProtocol {
    var name: String
    var created: String
    var characterId: Int
    var status: TechTest.Status
    var species: String
    var type: String
    var gender: TechTest.Gender
    var origin: TechTest.Origin
    var location: TechTest.LocationOfCharacter
    var image: String?
    var episodes: [URL]
    var characterURL: URL

    init(name: String,
         created: String,
         characterId: Int,
         status: Status,
         species: String,
         type: String,
         gender: Gender,
         origin: Origin,
         location: LocationOfCharacter,
         image: String,
         episodes: [URL],
         characterURL: URL) {
        self.name = name
        self.created = created
        self.characterId = characterId
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episodes = episodes
        self.characterURL = characterURL
    }
}
