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
    var next = true

    var storageManager: StorageManager

    // MARK: inits

    init(interactor: HomeInteractorProtocol, storageManager: StorageManager = StorageManager.shared) {
        self.interactor = interactor
        self.storageManager = storageManager
    }

    func viewDidLoadWasCalled() {
        callCharacterAPI()
    }

    func callCharacterAPI() {
        interactor.getPeopleResult(firstURL: urlToChange) { result in
            switch result {
            case let .success(peopleRetrieved):
                self.view?.loadingView(.show)
                let peopleFromCall = peopleRetrieved.results
                self.rmCharacter.append(contentsOf: peopleFromCall)
                self.storageManager.savePeople(people: self.rmCharacter)
                self.view?.loadPeople()
                self.view?.loadingView(.hide)
                if let nextUrl = peopleRetrieved.info.next {
                    self.urlToChange = nextUrl
                } else {
                    self.next = false
                }

            case let .failure(error):
                if let apiResults = self.storageManager.getPeople() {
                    self.next = false
                    self.rmCharacter = apiResults
                    self.view?.loadPeople()
                    self.view?.showError(title: ConstantsAPI.errorTitleCheckConnection,
                                         message: error.localizedDescription)
                } else {
                    self.view?.showError(title: ConstantsAPI.errorGeneralNoConnection,
                                         message: ConstantsAPI.errorMessageNoCache)
                }
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

    func checkNextCallIsNeeded() -> Bool {
        return next
    }
}
