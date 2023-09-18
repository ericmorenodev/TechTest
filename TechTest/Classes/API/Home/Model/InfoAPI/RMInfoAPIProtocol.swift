//
//  RMInfoAPIProtocol.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
protocol RMInfoProtocol {
    var count: Int { get }
    var pages: Int { get }
    var next: String? { get }
    var prev: String? { get }
}
