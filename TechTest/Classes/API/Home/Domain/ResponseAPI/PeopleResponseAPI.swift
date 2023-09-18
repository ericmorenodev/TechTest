//
//  PeopleResponseAPI.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
struct PeopleResponseAPI: PeopleResponseAPIProtocol, Codable {
    var info: RMInfoProtocol { castInfo }
    var results: [PeopleAPIProtocol] { castResult }

    private let castInfo: RMInfoAPI
    private let castResult: [PeopleAPI]

    enum CodingKeys: String, CodingKey {
        case info
        case results
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        castInfo = try values.decode(RMInfoAPI.self, forKey: .info)
        castResult = try values.decode([PeopleAPI].self, forKey: .results)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(castInfo, forKey: .info)
        try container.encode(castResult, forKey: .results)
    }
}
