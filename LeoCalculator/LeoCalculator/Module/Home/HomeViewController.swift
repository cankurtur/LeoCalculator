//
//  HomeViewController.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    enum ResultLabel {
        static let font: UIFont = .bold50
        static let initialText: String = Localizable.generalZero
    }
    
    enum NumpadButtons {
        static let titleFont: UIFont = .bold20
        static let cornerRadius: CGFloat = 8
    }
    
    enum BasicOperationButtons {
        static let addTitle: String = Localizable.homeAdd
        static let subtractTitle: String = Localizable.homeSubtract
        static let multiplyTitle: String = Localizable.homeMultiply
        static let divideTitle: String = Localizable.homeDivide

        static let titleFont: UIFont = .bold20
        static let cornerRadius: CGFloat = 8
    }
    
    enum ExtraOperationButtons {
        static let sinTitle: String = Localizable.homeSin
        static let cosTitle: String = Localizable.homeCos
        static let bitcoinToDollarTitle: String = Localizable.homeBitcoinToDollar
        static let titleFont: UIFont = .bold20
        static let cornerRadius: CGFloat = 8
    }
    
    enum ClearButton {
        static let titleFont: UIFont = .bold20
        static let cornerRadius: CGFloat = 22
        static let title: String = Localizable.homeClear
    }
    
    enum EqualButton {
        static let title: String = Localizable.homeEqual
        static let titleFont: UIFont = .bold20
        static let cornerRadius: CGFloat = 8
    }
    
    enum ThemeSwitch {
        static let offThumbTintColor: UIColor = .appOrange
        static let backgroundColor: UIColor = .appDarkGray
        static let onTintColor: UIColor = .appDarkGray
        static let onThumbTintColor: UIColor = .appRed
    }
}

// MARK: - ViewInterface

protocol HomeViewInterface: ViewInterface {
    func prepareUI()
    func setResultLabel(with result: String)
    func updateHiddenity(with hiddenModel: HomeHiddenModel)
    func updateUI(with uiModel: HomeUIModel)
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
    @IBOutlet private weak var themeSwitch: UISwitch!
    
    static var storyboardName: StoryboardNames {
        return .home
    }
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func prepareUI() {
        prepareLabels()
        prepareButtons()
        prepareSwitch()
    }
    
    func setResultLabel(with result: String) {
        resultLabel.text = result
    }
    
    func updateHiddenity(with hiddenModel: HomeHiddenModel) {
        addButton.isHidden = !hiddenModel.addIsHidden
        subtractButton.isHidden = !hiddenModel.subtractIsHidden
        multiplyButton.isHidden = !hiddenModel.multiplyIsHidden
        divideButton.isHidden = !hiddenModel.divideIsHidden
        sinButton.isHidden = !hiddenModel.sinIsHidden
        cosButton.isHidden = !hiddenModel.cosIsHidden
        bitcoinButton.isHidden = !hiddenModel.bitcoinIsHidden
    }
    
    func updateUI(with uiModel: HomeUIModel) {
        
        view.backgroundColor = uiModel.backgroundColor
        resultLabel.textColor = uiModel.resultTextColor
       
        numpadButtons.forEach { button in
            button.setTitleColor(uiModel.numpadTextColor, for: .normal)
            button.backgroundColor = uiModel.numpadBackgroundColor
        }
        
        addButton.setTitleColor(uiModel.basicOperationTextColor, for: .normal)
        addButton.backgroundColor = uiModel.basicOperationBackgroundColor
        
        subtractButton.setTitleColor(uiModel.basicOperationTextColor, for: .normal)
        subtractButton.backgroundColor = uiModel.basicOperationBackgroundColor
        
        multiplyButton.setTitleColor(uiModel.basicOperationTextColor, for: .normal)
        multiplyButton.backgroundColor = uiModel.basicOperationBackgroundColor
        
        divideButton.setTitleColor(uiModel.basicOperationTextColor, for: .normal)
        divideButton.backgroundColor = uiModel.basicOperationBackgroundColor
        
        sinButton.setTitleColor(uiModel.extraOperationTextColor, for: .normal)
        sinButton.backgroundColor = uiModel.extraOperationBackgroundColor
        
        cosButton.setTitleColor(uiModel.extraOperationTextColor, for: .normal)
        cosButton.backgroundColor = uiModel.extraOperationBackgroundColor

        bitcoinButton.setTitleColor(uiModel.extraOperationTextColor, for: .normal)
        bitcoinButton.backgroundColor = uiModel.extraOperationBackgroundColor
        
        clearButton.setTitleColor(uiModel.clearTextColor, for: .normal)
        clearButton.backgroundColor = uiModel.clearBackgroundColor

        equalButton.setTitleColor(uiModel.equalTextColor, for: .normal)
        equalButton.backgroundColor = uiModel.equalBackgroundColor
    }
}

// MARK: - Prepares

private extension HomeViewController {
    
    func prepareLabels() {
        resultLabel.text = Constant.ResultLabel.initialText
        resultLabel.font = Constant.ResultLabel.font
        resultLabel.textAlignment = .right
    }
    
    func prepareButtons() {
        numpadButtons.forEach { button in
            button.titleLabel?.font = Constant.NumpadButtons.titleFont
            button.layer.cornerRadius = Constant.NumpadButtons.cornerRadius
            button.addTarget(self, action: #selector(numpadButtonTapped(_:)), for: .touchUpInside)
        }
        
        addButton.setTitle(Constant.BasicOperationButtons.addTitle, for: .normal)
        addButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        addButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        addButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)
        
        subtractButton.setTitle(Constant.BasicOperationButtons.subtractTitle, for: .normal)
        subtractButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        subtractButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        subtractButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)

        multiplyButton.setTitle(Constant.BasicOperationButtons.multiplyTitle, for: .normal)
        multiplyButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        multiplyButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        multiplyButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)

        divideButton.setTitle(Constant.BasicOperationButtons.divideTitle, for: .normal)
        divideButton.titleLabel?.font = Constant.BasicOperationButtons.titleFont
        divideButton.layer.cornerRadius = Constant.BasicOperationButtons.cornerRadius
        divideButton.addTarget(self, action: #selector(basicOperationsTapped(_:)), for: .touchUpInside)

        sinButton.setTitle(Constant.ExtraOperationButtons.sinTitle, for: .normal)
        sinButton.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
        sinButton.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
        sinButton.addTarget(self, action: #selector(extraOperationsTapped(_:)), for: .touchUpInside)

        cosButton.setTitle(Constant.ExtraOperationButtons.cosTitle, for: .normal)
        cosButton.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
        cosButton.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
        cosButton.addTarget(self, action: #selector(extraOperationsTapped(_:)), for: .touchUpInside)

        bitcoinButton.setTitle(Constant.ExtraOperationButtons.bitcoinToDollarTitle, for: .normal)
        bitcoinButton.titleLabel?.font = Constant.ExtraOperationButtons.titleFont
        bitcoinButton.layer.cornerRadius = Constant.ExtraOperationButtons.cornerRadius
        bitcoinButton.addTarget(self, action: #selector(bitcoinButtonTapped), for: .touchUpInside)

        clearButton.setTitle(Constant.ClearButton.title, for: .normal)
        clearButton.titleLabel?.font = Constant.ClearButton.titleFont
        clearButton.layer.cornerRadius = Constant.ClearButton.cornerRadius
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        equalButton.setTitle(Constant.EqualButton.title, for: .normal)
        equalButton.titleLabel?.font = Constant.EqualButton.titleFont
        equalButton.layer.cornerRadius = Constant.EqualButton.cornerRadius
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchUpInside)
    }
    
    func prepareSwitch() {
        themeSwitch.layer.cornerRadius = themeSwitch.frame.height / 2
        themeSwitch.thumbTintColor = Constant.ThemeSwitch.offThumbTintColor
        themeSwitch.backgroundColor = Constant.ThemeSwitch.backgroundColor
        themeSwitch.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        themeSwitch.isOn = false
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
    
    func bitcoinButtonTapped() {
        presenter.bitcoinButtonTapped()
    }
    
    func didChangeValue(_ sender: UISwitch) {
        updateWaterSwitchStatus(sender.isOn)
        presenter.didChangeValueOfSwitch(sender.isOn)
    }
}

// MARK: - Helper

private extension HomeViewController {
    func updateWaterSwitchStatus(_ isOn: Bool) {
        themeSwitch.thumbTintColor = isOn ? Constant.ThemeSwitch.onThumbTintColor : Constant.ThemeSwitch.offThumbTintColor
        themeSwitch.onTintColor = Constant.ThemeSwitch.onTintColor
    }
}

