//
//  DetailContract.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import UIKit

protocol DetailViewProtocol: BaseProtocol {
    func loadInfo(RMCharacter: PeopleAPIProtocol)
}

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }

    func viewDidLoadWasCalled()
}

protocol DetailInteractorProtocol {
    func getCharacter() -> PeopleAPIProtocol
}
