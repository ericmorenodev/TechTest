//
//  HomeCoordinator.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation
import UIKit
import SwiftUI

class HomeCoordinator: HomeCoordinatorDelegate {
    func goToDetailScreen(people: PeopleAPIProtocol, sender: UIViewController) {
        let interactor = DetailInteractor(rmCharacter: people)
        let presenter = DetailPresenter(interactor: interactor)
        let view = DetailView(presenter: presenter)

        presenter.view = view

        sender.navigationController?.pushViewController(UIHostingController(rootView: view), animated: true)
    }
}
