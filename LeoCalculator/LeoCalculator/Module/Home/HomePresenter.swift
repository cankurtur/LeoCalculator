//
//  HomePresenter.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import Foundation
import LeoCalculation

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
    private let compositionRoot: CompositionRoot
    
    var previousNumber: Double = 0
    var currentNumber: Double = 0
    var resultNumber: Double = 0
    var currentBasicOperation: BasicOperations?
    var currentExtraOpertaion: ExtraOperations?
    var isOnTheFirstCalculation: Bool = false
    
    var input: String = ""
    
    init(router: HomeRouterInterface,
         interactor: HomeInteractorInterface,
         view: HomeViewInterface?,
         compositionRoot: CompositionRoot = CompositionRoot.shared) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.compositionRoot = compositionRoot
    }
}

// MARK: - HomePresenterInterface

extension HomePresenter: HomePresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
        view?.prepareHiddenity(with: compositionRoot.hiddenModel)
        view?.updateUI(with: compositionRoot.themeManager.getHomeUIModel())
    }
    
    func numpadButtonTapped(title: String?) {
        guard let number = title else { return }
        
        if number == ".", input.contains(".") {
            return
        }
        
        if input.count == 1, input.contains("0") {
            input = ""
        }
        
        input += number
        currentNumber = Double(input) ?? 0
        view?.setResultLabel(with: input)
    }
    
    func basicOperationsTapped(operation: String?) {
        guard let operation = operation else { return }

        if isOnTheFirstCalculation {
            resultNumber  = currentBasicOperation?.makeOperation(previousNumber, currentNumber) ?? 0
            view?.setResultLabel(with: "\(resultNumber)")
            isOnTheFirstCalculation = false
            previousNumber = currentNumber
            currentNumber = 0
            input = ""
            currentBasicOperation = BasicOperations.currentOperation(operation)
        } else {
            
            if resultNumber == 0.0 {
                previousNumber = currentNumber
                isOnTheFirstCalculation = true
                input = ""
                currentNumber = 0
                currentBasicOperation = BasicOperations.currentOperation(operation)
                
            } else {
                resultNumber  = currentBasicOperation?.makeOperation(resultNumber, currentNumber) ?? 0
                view?.setResultLabel(with: "\(resultNumber)")
                isOnTheFirstCalculation = false
                previousNumber = currentNumber
                currentNumber = 0
                input = ""
                currentBasicOperation = BasicOperations.currentOperation(operation)
            }
        }
    }
    
    func extraOperationsTapped(operation: String?) {
        guard let operation = operation else { return }
        
        currentExtraOpertaion = ExtraOperations.currentOperation(operation)
        
        guard currentExtraOpertaion != nil else { return }
        
        if currentNumber > 0 {
            let result = currentExtraOpertaion?.getValue(currentNumber) ?? 0
            view?.setResultLabel(with: "\(result)")
            resetCalculation()
            return
        }
        
        if resultNumber > 0 {
            let result = currentExtraOpertaion?.getValue(resultNumber) ?? 0
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
        let result = currentOperation.makeOperation(firstNumber, currentNumber) ?? 0
        view?.setResultLabel(with: "\(result)")
    }
    
    func bitcoinButtonTapped() {
        
        // The base API doesn't support the current date rate on the free version, which is why twoDaysBefore's value was created.
        let twoDaysBefore = Date().twoDaysBefore.toString()
        
        if currentNumber > 0 {
            view?.showHUD()
            interactor.getConversionResult(amount: Float(currentNumber), date: twoDaysBefore)
            return
        }
        
        if resultNumber > 0 {
            view?.showHUD()
            interactor.getConversionResult(amount: Float(resultNumber), date: twoDaysBefore)
            return
        }
    }
    
    func didChangeValueOfSwitch(_ isOn: Bool) {
        let theme = isOn ? Theme.red : Theme.original
        compositionRoot.themeManager.changeCurrentTheme(with: theme)
        view?.updateUI(with: compositionRoot.themeManager.getHomeUIModel())
    }
}

// MARK: - Helper

private extension HomePresenter {
    func resetCalculation() {
        input = "0"
        currentNumber = 0
        currentBasicOperation = nil
        previousNumber = 0
        resultNumber = 0
        isOnTheFirstCalculation = false
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    func onGetConversionResultReceived(_ result: Result<ConversionResultResponse, APIClientError>) {
        switch result {
        case .success(let response):
            view?.dismissHUD()
            guard let convertedAmount = response.convertedAmount else {
                return
            }
            
            view?.setResultLabel(with: "\(convertedAmount)")
            resetCalculation()
        case .failure(let error):
            print(error)
            // TODO: - Error handling will be add.
            break
        }
    }
}
