//
//  ConstantsAPI.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
import UIKit

struct ConstantsAPI {
    static let apiCharacter = "https://rickandmortyapi.com/api/character"
    static let apiLocations = "https://rickandmortyapi.com/api/location"
    static let apiEpisodes = "https://rickandmortyapi.com/api/episode"

    static let locationTitle = "Location"
    static let characterTitle = "Characters"
    static let episodesTitle = "Episodes"

    enum TabName: String {
        case characters
        case locations
        case episodes
    }

    static let imageLocation = UIImage(systemName: "location")
    static let imageCharacter = UIImage(systemName: "character")
    static let imageEpisodes = UIImage(systemName: "book")

    struct LocationUI: RMLocationAPIProtocol {
        var locationId: Int
        var name: String
        var residents: [String]
        var dimensions: String
        var type: String
        var locationURL: String
        var created: String
    }

    static let locationUIPlaceholder = LocationUI(locationId: 1,
                                                  name: "Placeholder",
                                                  residents: ["Placeholder"],
                                                  dimensions: "Placeholder",
                                                  type: "Placeholder",
                                                  locationURL: "Placeholder",
                                                  created: "Placeholder")
}
