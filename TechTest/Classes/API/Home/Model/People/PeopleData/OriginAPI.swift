//
//  OriginAPI.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
struct OriginAPI: Origin, Codable {
    var name: String
    var url: String

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(url, forKey: .url)
    }
}
