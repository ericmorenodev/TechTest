//
//  HomeViewController.swift
//  TechTest
//
//  Created by Eric Moreno on 12/9/23.
//

import Foundation
import UIKit

internal class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    // MARK: Outlets

    @IBOutlet var tableViewPeople: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!

    // MARK: Variables

    var presenter: HomePresenterProtocol?
    var delegate: HomeCoordinatorDelegate?

    // MARK: Inits

    public convenience init(presenter: HomePresenterProtocol) {
        self.init(nibName: "HomeView", bundle: nil)
        self.presenter = presenter
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewPeople.dataSource = self
        tableViewPeople.delegate = self
        searchBar.delegate = self

        tableViewPeople.register(UINib(nibName: "HomeCustomCell",
                                       bundle: nil),
                                 forCellReuseIdentifier: "HomeCustomCell")
        presenter?.viewDidLoadWasCalled()
    }

    // MARK: Table view Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getPeopleCount() ?? 0
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let numrowToMakeNewApiCall = presenter?.getPeopleCount() else { return }
        if presenter?.checkNextCallIsNeeded() == true {
            if indexPath.row == (numrowToMakeNewApiCall - 5) {
                presenter?.callCharacterAPI()
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCustomCell", for: indexPath) as? HomeCustomCellView
        else { return HomeCustomCellView() }

        guard let rmCharacterAtIndex = presenter?.rmCharacterAtIndex(index: indexPath.row) else { return cell }

        cell.lblName.text = rmCharacterAtIndex.name

        presenter?.downloadCharacterImageHome(rmCharacterAtIndex, cell)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rmCharacterAtIndex = presenter?.rmCharacterAtIndex(index: indexPath.row) else {
            // Alert view mostrando error
            return
        }

        delegate?.goToDetailScreen(people: rmCharacterAtIndex, sender: self)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.filterRMCharacter(with: searchText)
    }
}

extension HomeViewController: HomeViewProtocol {
    func loadPeople() {
        DispatchQueue.main.async {
            self.tableViewPeople.reloadData()
        }
    }

    func loadingView(_ state: LoadingState) {
        switch state {
        case .show:
            showLoading()
        case .hide:
            hideLoading()
        }
    }

    private func showLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.isHidden = false
            self.loadingIndicator.startAnimating()
        }
    }

    private func hideLoading() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
        }
    }

    func showError(title: String, message: String) {
        DispatchQueue.main.async {
            ShowAlert().showAlertView(title: title,
                                      message: message,
                                      button1Text: "OK",
                                      parent: self)
        }
    }
}
