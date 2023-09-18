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

    // MARK: Strings

    static let errorTitleCheckConnection = "Something is wrong, check your connection."
}
