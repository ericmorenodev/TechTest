//
//  HomeContract.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation
import UIKit

protocol HomeViewProtocol: BaseProtocol {
    func loadPeople()
    func loadingView(_ state: LoadingState)
}

enum LoadingState {
    case show
    case hide
}

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    func viewDidLoadWasCalled()
    func callCharacterAPI()
    func getPeopleCount() -> Int
    func rmCharacterAtIndex(index: Int) -> PeopleAPIProtocol
    func checkNextCallIsNeeded() -> Bool
}

protocol HomeInteractorProtocol {
    func getPeopleResult(firstURL: String, completion: @escaping (Result<PeopleResponseAPIProtocol, Error>) -> Void)
}

protocol HomeServiceProtocol {
    func getDataService() -> PeopleServiceAPIProtocol
}

protocol HomeCoordinatorDelegate {
    func goToDetailScreen(people: PeopleAPIProtocol, sender: UIViewController)
}
