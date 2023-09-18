//
//  HomeCoordinator.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation
import SwiftUI
import UIKit

class HomeCoordinator: HomeCoordinatorDelegate {
    let storageManager = StorageManager.shared
    func goToDetailScreen(people: PeopleAPIProtocol, sender: UIViewController) {
        let interactor = DetailInteractor(rmCharacter: people)
        let presenter = DetailPresenter(interactor: interactor, storageManager: storageManager)
        let view = DetailView(presenter: presenter)

        presenter.view = view

        sender.navigationController?.pushViewController(UIHostingController(rootView: view), animated: true)
    }
}
