//
//  HomePresenter.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation

internal final class HomePresenter: HomePresenterProtocol {
    // MARK: Variables

    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol
    var rmCharacter = [PeopleAPIProtocol]()

    var urlToChange = ConstantsAPI.apiCharacter

    // MARK: inits

    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }

    func viewDidLoadWasCalled() {
        callCharacterAPI()
    }

    internal func callCharacterAPI() {
        interactor.getPeopleResult(firstURL: urlToChange) { result in
            self.view?.loadingView(.show)

            switch result {
            case let .failure(error):
                self.view?.loadingView(.hide)
                self.view?.showError(title: ConstantsAPI.errorTitleCheckConnection, message: error.localizedDescription)

            case let .success(rmCharacterSuccess):
                self.view?.loadPeople()
                self.view?.loadingView(.hide)
                self.rmCharacter.append(contentsOf: rmCharacterSuccess)
            }
        }
    }

    func viewWillAppearWasCalled() {
        callCharacterAPI()
    }

    func getPeopleCount() -> Int {
        return rmCharacter.count
    }

    func rmCharacterAtIndex(index: Int) -> PeopleAPIProtocol {
        return rmCharacter[index]
    }
}
