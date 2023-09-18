//
//  AppCoordinator.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var window: UIWindow

    lazy var navigationController: UINavigationController = {
        getNavigation()

    }()

    // we get the navigation controller here and return with the properties
    private func getNavigation() -> UINavigationController {
        let navigator = UINavigationController()
        return navigator
    }

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    func start() {
        showHome()
    }

    func showHome() {
        let coordinator = HomeCoordinator()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor)
        let view = HomeViewController(presenter: presenter)

        view.delegate = coordinator
        presenter.view = view

        navigationController.setViewControllers([view], animated: true)
    }
}
