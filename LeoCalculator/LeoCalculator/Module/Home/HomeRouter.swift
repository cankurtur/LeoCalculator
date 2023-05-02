//
//  HomeRouter.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

// MARK: - RouterInterface

protocol HomeRouterInterface: RouterInterface { }

// MARK: - HomeRouter

final class HomeRouter {
    private weak var presenter: HomePresenter?
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UINavigationController {

        let interactor = HomeInteractor()
        let view = HomeViewController.instantiate()
        let navCon = UINavigationController(rootViewController: view)
        navCon.modalPresentationStyle = .fullScreen
        let router = HomeRouter(navigationController: navCon)
        let presenter = HomePresenter(router: router, interactor: interactor, view: view)
        router.presenter = presenter
        view.presenter = presenter
        interactor.output = presenter
        
        return navCon
    }
}

// MARK: - HomeRouterInterface

extension HomeRouter: HomeRouterInterface { }
