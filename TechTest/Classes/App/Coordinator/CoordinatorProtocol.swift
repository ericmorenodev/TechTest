//
//  Coordinator.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import UIKit

public protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
