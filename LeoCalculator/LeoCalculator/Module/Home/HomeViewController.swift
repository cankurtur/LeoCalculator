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
    
    enum ClearButton {
        static let titleFont: UIFont = .bold20
        static let titleColor: UIColor = .black
        static let backgroundColor: UIColor = .darkGray
        static let cornerRadius: CGFloat = 22
    }
    
    enum EqualButton {
        static let titleFont: UIFont = .bold20
        static let titleColor: UIColor = .black
        static let backgroundColor: UIColor = .darkGray
        static let cornerRadius: CGFloat = 8
    }
}

// MARK: - ViewInterface

protocol HomeViewInterface: ViewInterface {
    func prepareUI(addIsHidden: Bool,
                   subtractIsHidden: Bool,
                   multiplyIsHidden: Bool,
                   divideIsHidden: Bool,
                   sinIsHidden: Bool,
                   cosIsHidden: Bool,
                   bitcoinIsHidden: Bool)
    func setResultLabel(with result: String)
}

// MARK: - HomeViewController

final class HomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var numpadButtons: [UIButton]!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    @IBOutlet private weak var sinButton: UIButton!
    @IBOutlet private weak var cosButton: UIButton!
    @IBOutlet private weak var bitcoinButton: UIButton!
  
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
    func prepareUI(addIsHidden: Bool,
                   subtractIsHidden: Bool,
                   multiplyIsHidden: Bool,
                   divideIsHidden: Bool,
                   sinIsHidden: Bool,
                   cosIsHidden: Bool,
                   bitcoinIsHidden: Bool) {
        view.backgroundColor = Constant.backgroundColor
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        prepareLabels()
        prepareButtons(addIsHidden: addIsHidden,
                       subtractIsHidden: subtractIsHidden,
                       multiplyIsHidden: multiplyIsHidden,
                       divideIsHidden: divideIsHidden,
                       sinIsHidden: sinIsHidden,
                       cosIsHidden: cosIsHidden,
                       bitcoinIsHidden: bitcoinIsHidden)
    }
    
    func setResultLabel(with result: String) {
        resultLabel.text = result
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
    
    func prepareButtons(addIsHidden: Bool,
                        subtractIsHidden: Bool,
                        multiplyIsHidden: Bool,
                        divideIsHidden: Bool,
                        sinIsHidden: Bool,
                        cosIsHidden: Bool,
                        bitcoinIsHidden: Bool) {
        numpadButtons.forEach { button in
            button.titleLabel?.font = Constant.NumpadButtons.titleFont
            button.setTitleColor(Constant.NumpadButtons.titleColor, for: .normal)
            button.backgroundColor = Constant.NumpadButtons.backgroundColor
            button.layer.cornerRadius = Constant.NumpadButtons.cornerRadius
            button.addTarget(self, action: #selector(numpadButtonTapped(_:)), for: .touchUpInside)
        }
        
        addButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        addButton.setTitleColor(Constant.BasicOperationButtons.titleColor, for: .normal)
        addButton.backgroundColor = Constant.BasicOperationButtons.backgroundColor
        addButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        addButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)
        addButton.isHidden = addIsHidden
        
        subtractButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        subtractButton.setTitleColor(Constant.BasicOperationButtons.titleColor, for: .normal)
        subtractButton.backgroundColor = Constant.BasicOperationButtons.backgroundColor
        subtractButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        subtractButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)
        subtractButton.isHidden = subtractIsHidden

        multiplyButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        multiplyButton.setTitleColor(Constant.BasicOperationButtons.titleColor, for: .normal)
        multiplyButton.backgroundColor = Constant.BasicOperationButtons.backgroundColor
        multiplyButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        multiplyButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)
        multiplyButton.isHidden = multiplyIsHidden

        divideButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        divideButton.setTitleColor(Constant.BasicOperationButtons.titleColor, for: .normal)
        divideButton.backgroundColor = Constant.BasicOperationButtons.backgroundColor
        divideButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        divideButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)
        divideButton.isHidden = divideIsHidden

        sinButton.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
        sinButton.setTitleColor(Constant.ExtraOperationButtons.titleColor, for: .normal)
        sinButton.backgroundColor = Constant.ExtraOperationButtons.backgroundColor
        sinButton.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
        sinButton.addTarget(self, action: #selector(extraOperationsTapped(_:)), for: .touchUpInside)
        sinButton.isHidden = sinIsHidden

        cosButton.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
        cosButton.setTitleColor(Constant.ExtraOperationButtons.titleColor, for: .normal)
        cosButton.backgroundColor = Constant.ExtraOperationButtons.backgroundColor
        cosButton.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
        cosButton.addTarget(self, action: #selector(extraOperationsTapped(_:)), for: .touchUpInside)
        cosButton.isHidden = cosIsHidden

        bitcoinButton.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
        bitcoinButton.setTitleColor(Constant.ExtraOperationButtons.titleColor, for: .normal)
        bitcoinButton.backgroundColor = Constant.ExtraOperationButtons.backgroundColor
        bitcoinButton.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
        bitcoinButton.addTarget(self, action: #selector(extraOperationsTapped(_:)), for: .touchUpInside)
        bitcoinButton.isHidden = bitcoinIsHidden

        clearButton.titleLabel?.font = Constant.ClearButton.titleFont
        clearButton.setTitleColor(Constant.ClearButton.titleColor, for: .normal)
        clearButton.backgroundColor = Constant.ClearButton.backgroundColor
        clearButton.layer.cornerRadius = Constant.ClearButton.cornerRadius
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        equalButton.titleLabel?.font = Constant.EqualButton.titleFont
        equalButton.setTitleColor(Constant.EqualButton.titleColor, for: .normal)
        equalButton.backgroundColor = Constant.EqualButton.backgroundColor
        equalButton.layer.cornerRadius = Constant.EqualButton.cornerRadius
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchUpInside)
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
        presenter.extraOperationsTapped(operation: sender.titleLabel?.text)
    }
    
    func clearButtonTapped() {
        presenter.clearButtonTapped()
    }
    
    func equalButtonTapped() {
        presenter.equalButtonTapped()
    }
}
