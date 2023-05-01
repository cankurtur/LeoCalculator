//
//  HomePresenter.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import Foundation

// MARK: - PresenterInterface

protocol HomePresenterInterface: PresenterInterface { }

// MARK: - HomePresenter

final class HomePresenter {
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
  
    init(router: HomeRouterInterface,
         interactor: HomeInteractorInterface,
         view: HomeViewInterface?) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}

// MARK: - HomePresenterInterface

extension HomePresenter: HomePresenterInterface {
    func viewDidLoad() {
       
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput { }

