//
//  HomePresenter.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import Foundation
import LeoCalculation

// MARK: - Constant

private enum Constant {
    static let emptyString: String = Localizable.generalEmpty
    static let zero: String = Localizable.generalZero
    static let point: String = Localizable.generalPoint
    static let defaultValue: Double = 0
    static let pointCount: Int = 1
}

// MARK: - PresenterInterface

protocol HomePresenterInterface: PresenterInterface {
    func numpadButtonTapped(title: String?)
    func basicOperationsTapped(operation: String?)
    func extraOperationsTapped(operation: String?)
    func clearButtonTapped()
    func equalButtonTapped()
    func bitcoinButtonTapped()
    func didChangeValueOfSwitch(_ isOn: Bool)
}

// MARK: - HomePresenter

final class HomePresenter {
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
    private let compositionRoot: CompositionRootInterface
    
    private var previousNumber: Double = 0
    private var currentNumber: Double = 0
    private var resultNumber: Double = 0
    private var currentBasicOperation: BasicOperations?
    private var currentExtraOpertaion: ExtraOperations?
    private(set) var isOnTheFirstCalculation: Bool = false
    
    var input: String = Constant.emptyString
    
    init(router: HomeRouterInterface,
         interactor: HomeInteractorInterface,
         view: HomeViewInterface?,
         compositionRoot: CompositionRootInterface = CompositionRoot.shared) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.compositionRoot = compositionRoot
    }
    
    deinit {
        compositionRoot.notificationCenter.removeWith(self)
    }
}

// MARK: - HomePresenterInterface

extension HomePresenter: HomePresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
        view?.updateUI(theme: compositionRoot.themeManager.getCurrentTheme())
        
        compositionRoot.notificationCenter.add(
            observer: self,
            selector: #selector(shouldUpdateHomeButtons(_:)),
            name: .shouldUpdateHomeButtons,
            object: nil
        )
    }
    
    func numpadButtonTapped(title: String?) {
        guard let number = title else { return }
        
        if number == Constant.point, input.contains(Constant.point) {
            return
        }
        
        if input.count == Constant.pointCount, input.contains(Constant.zero) {
            input = Constant.emptyString
        }
        
        input += number
        currentNumber = Double(input) ?? Constant.defaultValue
        view?.setResultLabel(with: input)
    }
    
    func basicOperationsTapped(operation: String?) {
        guard let operation = operation else { return }
        
        if isOnTheFirstCalculation {
            resultNumber = currentBasicOperation?.makeOperation(previousNumber, currentNumber) ?? Constant.defaultValue
            view?.setResultLabel(with: "\(resultNumber)")
            updateCalculation(isFirstCalculation: false, operation: operation)
            return
        }
        
        if resultNumber == Constant.defaultValue {
            updateCalculation(isFirstCalculation: true, operation: operation)
        } else {
            resultNumber = currentBasicOperation?.makeOperation(resultNumber, currentNumber) ?? Constant.defaultValue
            view?.setResultLabel(with: "\(resultNumber)")
            updateCalculation(isFirstCalculation: false, operation: operation)
        }
    }
    
    func extraOperationsTapped(operation: String?) {
        guard let operation = operation else { return }
        
        currentExtraOpertaion = ExtraOperations.currentOperation(operation)
        
        guard currentExtraOpertaion != nil else { return }
        
        if currentNumber > Constant.defaultValue {
            let result = currentExtraOpertaion?.getValue(currentNumber) ?? Constant.defaultValue
            view?.setResultLabel(with: "\(result)")
            resetCalculation()
            return
        }
        
        if resultNumber > Constant.defaultValue {
            let result = currentExtraOpertaion?.getValue(resultNumber) ?? Constant.defaultValue
            view?.setResultLabel(with: "\(result)")
            resetCalculation()
            return
        }
    }
    
    func clearButtonTapped() {
        resetCalculation()
        view?.setResultLabel(with: input)
    }
    
    func equalButtonTapped() {
        guard let currentOperation = currentBasicOperation else { return }
        
        let firstNumber = isOnTheFirstCalculation ? previousNumber : resultNumber
        let result = currentOperation.makeOperation(firstNumber, currentNumber) ?? Constant.defaultValue
        view?.setResultLabel(with: "\(result)")
    }
    
    func bitcoinButtonTapped() {
        
        // The base API doesn't support the current date rate on the free version, which is why twoDaysBefore's value was created.
        let twoDaysBefore = Date().twoDaysBefore.toString()
        
        if currentNumber > Constant.defaultValue {
            view?.showHUD()
            interactor.getConversionResult(amount: Float(currentNumber), date: twoDaysBefore)
            return
        }
        
        if resultNumber > Constant.defaultValue {
            view?.showHUD()
            interactor.getConversionResult(amount: Float(resultNumber), date: twoDaysBefore)
            return
        }
    }
    
    func didChangeValueOfSwitch(_ isOn: Bool) {
        let theme = isOn ? Theme.red : Theme.original
        compositionRoot.themeManager.changeCurrentTheme(with: theme)
        view?.updateUI(theme: compositionRoot.themeManager.getCurrentTheme())
    }
}

// MARK: - Helper

private extension HomePresenter {
    func resetCalculation() {
        input = Constant.zero
        currentNumber = Constant.defaultValue
        currentBasicOperation = nil
        previousNumber = Constant.defaultValue
        resultNumber = Constant.defaultValue
        isOnTheFirstCalculation = false
    }
    
    func updateCalculation(isFirstCalculation: Bool, operation: String) {
        isOnTheFirstCalculation = isFirstCalculation
        previousNumber = currentNumber
        currentNumber = Constant.defaultValue
        input = Constant.emptyString
        currentBasicOperation = BasicOperations.currentOperation(operation)
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    func onGetConversionResultReceived(_ result: Result<ConversionResultResponse, APIClientError>) {
        view?.dismissHUD()
        switch result {
        case .success(let response):
            guard let convertedAmount = response.convertedAmount else {
                return
            }
            
            view?.setResultLabel(with: "\(convertedAmount)")
            resetCalculation()
        case .failure(let error):
            view?.showPopup(error: error, buttonAction: nil)
        }
    }
}

// MARK: - Actions

@objc
private extension HomePresenter {
    func shouldUpdateHomeButtons(_ notification: Notification) {
        guard let succeess = notification.object as? Bool, succeess else { return }
        
        let model = HomeHiddenModel(addIsHidden: compositionRoot.rcManager.bool(forKey: .isAddButtonEnabled),
                                    subtractIsHidden: compositionRoot.rcManager.bool(forKey: .isSubtractButtonEnabled),
                                    multiplyIsHidden: compositionRoot.rcManager.bool(forKey: .isMultiplyButtonEnabled),
                                    divideIsHidden: compositionRoot.rcManager.bool(forKey: .isDivideButtonEnabled),
                                    sinIsHidden: compositionRoot.rcManager.bool(forKey: .isSinButtonEnabled),
                                    cosIsHidden: compositionRoot.rcManager.bool(forKey: .isCosButtonEnabled),
                                    bitcoinIsHidden: compositionRoot.rcManager.bool(forKey: .isBitcoinButtonEnabled))
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.view?.updateButtonsHiddenity(with: model)
        }
    }
}
