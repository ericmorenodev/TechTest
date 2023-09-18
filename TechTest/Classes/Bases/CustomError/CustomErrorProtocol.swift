//
//  CustomErrorProtocol.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
protocol CustomErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}
