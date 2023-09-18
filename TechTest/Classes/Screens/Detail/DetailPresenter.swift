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

    init(interactor: DetailInteractorProtocol) {
        self.interactor = interactor
        RMCharacter = interactor.getCharacter()
    }
}
