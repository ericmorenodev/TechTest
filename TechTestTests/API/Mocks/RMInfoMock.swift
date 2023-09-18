//
//  RMInfoMock.swift
//  TechTestTests
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
@testable import TechTest

struct RMInfoAPIMock: RMInfoProtocol {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?

    init(count: Int, pages: Int, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
