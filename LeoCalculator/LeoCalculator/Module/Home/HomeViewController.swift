//
//  HomeViewController.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant { }

// MARK: - ViewInterface

protocol HomeViewInterface: ViewInterface { }

// MARK: - HomeViewController

final class HomeViewController: UIViewController, Storyboarded {

    static var storyboardName: StoryboardNames {
        return .home
    }
    
    var presenter: HomePresenterInterface!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
    
}
