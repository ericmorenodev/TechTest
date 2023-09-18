//
//  RMInfoAPI.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
struct RMInfoAPI: RMInfoProtocol, Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?

    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}
