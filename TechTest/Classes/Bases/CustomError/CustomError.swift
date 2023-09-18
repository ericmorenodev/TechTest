//
//  CustomError.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation

struct CustomError: CustomErrorProtocol {
    var title: String?
    var code: Int
    var errorDescription: String?
    var failureReason: String?

    init(title: String?, description: String, code: Int) {
        self.title = title
        self.code = code
        errorDescription = description
        failureReason = description
    }
}
