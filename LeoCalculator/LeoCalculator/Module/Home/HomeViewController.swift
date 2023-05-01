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
    
    @IBOutlet private var numpadButtons: [UIButton]!
    @IBOutlet private var basicOperationButtons: [UIButton]!
    @IBOutlet private var extraOperationButtons: [UIButton]!
    
    static var storyboardName: StoryboardNames {
        return .home
    }
    
    var presenter: HomePresenterInterface!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numpadButtons.forEach { button in
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 8
        }
        
        basicOperationButtons.forEach { button in
            button.backgroundColor = .systemOrange
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8
        }
        
        extraOperationButtons.forEach { button in
            button.backgroundColor = .darkGray
            button.setTitleColor(.systemOrange, for: .normal)
            button.layer.cornerRadius = 8
        }
    }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
    
}
