//
//  HomeViewController.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    static let backgroundColor: UIColor = .clear
    
    enum ResultLabel {
        static let font: UIFont = .bold50
        static let textColor: UIColor = .white
        static let initialText: String = "0"
    }
    
    enum NumpadButtons {
        static let titleFont: UIFont = .bold20
        static let titleColor: UIColor = .white
        static let backgroundColor: UIColor = .gray
        static let cornerRadius: CGFloat = 8
    }
    
    enum BasicOperationButtons {
        static let titleFont: UIFont = .bold20
        static let titleColor: UIColor = .black
        static let backgroundColor: UIColor = .systemOrange
        static let cornerRadius: CGFloat = 8
    }
    
    enum ExtraOperationButtons {
        static let titleFont: UIFont = .bold20
        static let titleColor: UIColor = .systemOrange
        static let backgroundColor: UIColor = .darkGray
        static let cornerRadius: CGFloat = 8
    }
}

// MARK: - ViewInterface

protocol HomeViewInterface: ViewInterface {
    func prepareUI()
}

// MARK: - HomeViewController

final class HomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var numpadButtons: [UIButton]!
    @IBOutlet private var basicOperationButtons: [UIButton]!
    @IBOutlet private var extraOperationButtons: [UIButton]!
    
    static var storyboardName: StoryboardNames {
        return .home
    }
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func prepareUI() {
        view.backgroundColor = Constant.backgroundColor
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        prepareLabels()
        prepareButtons()
    }
}

// MARK: - Prepares

private extension HomeViewController {
    
    func prepareLabels() {
        resultLabel.text = Constant.ResultLabel.initialText
        resultLabel.font = Constant.ResultLabel.font
        resultLabel.textColor = Constant.ResultLabel.textColor
        resultLabel.textAlignment = .right
    }
    
    func prepareButtons() {
        numpadButtons.forEach { button in
            button.titleLabel?.font = Constant.NumpadButtons.titleFont
            button.setTitleColor(Constant.NumpadButtons.titleColor, for: .normal)
            button.backgroundColor = Constant.NumpadButtons.backgroundColor
            button.layer.cornerRadius = Constant.NumpadButtons.cornerRadius
            button.addTarget(self, action: #selector(numpadButtonTapped(_:)), for: .touchUpInside)
        }

        basicOperationButtons.forEach { button in
            button.titleLabel?.font = Constant.BasicOperationButtons.titleFont
            button.setTitleColor(Constant.BasicOperationButtons.titleColor, for: .normal)
            button.backgroundColor = Constant.BasicOperationButtons.backgroundColor
            button.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
            button.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)
        }
        
        extraOperationButtons.forEach { button in
            button.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
            button.setTitleColor(Constant.ExtraOperationButtons.titleColor, for: .normal)
            button.backgroundColor = Constant.ExtraOperationButtons.backgroundColor
            button.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
            button.addTarget(self, action: #selector(extraOperationsTapped(_:)), for: .touchUpInside)
        }
    }
}

// MARK: - Actions

@objc
private extension HomeViewController {
    func numpadButtonTapped(_ sender: UIButton) {
        presenter.numpadButtonTapped(title: sender.titleLabel?.text)
    }
    
    func basicOperationsTapped(_ sender: UIButton) {
        presenter.basicOperationsTapped(operation: sender.titleLabel?.text)
    }
    
    func extraOperationsTapped(_ sender: UIButton) {
        presenter.extraOperationsTapped(title: sender.titleLabel?.text)
    }
}
