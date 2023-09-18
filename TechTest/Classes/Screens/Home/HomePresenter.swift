//
//  HomePresenter.swift
//  TechTest
//
//  Created by Eric Moreno on 16/9/23.
//

import Foundation
import UIKit

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

    func downloadCharacterImageHome(_ rmCharacterAtIndex: PeopleAPIProtocol, _ cell: HomeCustomCellView) {
        // Try first to find the image in the cache
        if let cachedImage = storageManager.getCharacterImage(characterId: rmCharacterAtIndex.characterId) {
            cell.peopleImage.image = cachedImage
        } else {
            if let imageUrlString = rmCharacterAtIndex.image, let imageUrl = URL(string: imageUrlString) {
                let task = URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                    if error == nil, let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.peopleImage.image = image

                            // save the image in the cache
                            self.storageManager.saveCharacterImage(image: image, characterId: rmCharacterAtIndex.characterId)
                        }
                    } else {
                        DispatchQueue.main.async {
                            cell.peopleImage.image = UIImage(systemName: "person.circle")?.withTintColor(.gray)
                        }
                        print("Error Downloading Image: \(error?.localizedDescription ?? "")")
                        self.view?.loadingView(.hide)
                    }
                }
                task.resume()
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
