//
//  DetailPresenter.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation

class DetailPresenter: ObservableObject {
    @Published var RMCharacter: PeopleAPIProtocol

    var view: DetailView?
    var interactor: DetailInteractorProtocol
    var storageManager: StorageManager

    init(interactor: DetailInteractorProtocol, storageManager: StorageManager) {
        self.interactor = interactor
        self.storageManager = storageManager
        RMCharacter = interactor.getCharacter()
    }
}
