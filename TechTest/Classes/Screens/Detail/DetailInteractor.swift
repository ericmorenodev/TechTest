//
//  DetailInteractor.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation

internal final class DetailInteractor {
    // MARK: Variables

    var rmCharacter: PeopleAPIProtocol

    // MARK: Inits

    init(rmCharacter: PeopleAPIProtocol) {
        self.rmCharacter = rmCharacter
    }
}

extension DetailInteractor: DetailInteractorProtocol {
    func getCharacter() -> PeopleAPIProtocol {
        return rmCharacter
    }
}
