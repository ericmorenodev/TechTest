//
//  AlertCustom.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import Foundation
import UIKit

protocol ShowAlertProtocol {
    func showAlertView(title: String, message: String, button1Text: String, parent: UIViewController)
}

struct ShowAlert: ShowAlertProtocol {
    func showAlertView(title: String, message: String, button1Text: String, parent: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let btnTryAgain = UIAlertAction(title: button1Text,
                                        style: .default)

        alertController.addAction(btnTryAgain)
        parent.present(alertController, animated: true)
    }
}
