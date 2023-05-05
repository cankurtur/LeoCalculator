//
//  HomeInteractor.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import Foundation

// MARK: - InteractorInterface

protocol HomeInteractorInterface: InteractorInterface {
    func getConversionResult(amount: Float, date: String)
}

// MARK: - HomeInteractorOutput

protocol HomeInteractorOutput: AnyObject {
    func onGetConversionResultReceived(_ result: Result<ConversionResultResponse, APIClientError>)
}

// MARK: - HomeInteractor

final class HomeInteractor {
    private let networkManager: NetworkManagerProtocol
    
    weak var output: HomeInteractorOutput?
    
    init( ) {
        self.networkManager = CompositionRoot.shared.networkManager
    }
}

// MARK: - HomeInteractorInterface
extension HomeInteractor: HomeInteractorInterface {

    func getConversionResult(amount: Float, date: String) {
        networkManager.request(
            endpoint: ConvertingCurrenciesEndpointItem.convertingCurrencies(
                baseCurrency: .btc,
                targetCurrency: .usd,
                date: date,
                baseAmount: amount
            ),
            responseType: ConversionResultResponse.self) { [weak self] result in
                guard let self = self else { return }
                
                self.output?.onGetConversionResultReceived(result)
            }
    }
}
