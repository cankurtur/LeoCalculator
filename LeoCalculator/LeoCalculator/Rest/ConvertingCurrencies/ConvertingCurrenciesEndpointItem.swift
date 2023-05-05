//
//  ConvertingCurrenciesEndpointItem.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import LeoNetworking

enum ConvertingCurrenciesEndpointItem: Endpoint {
case convertingCurrencies(baseCurrency: Currencies, targetCurrency: Currencies, date: String, baseAmount: Float)
    
    var path: String {
        let apiKey = Config.shared.abstractAPIApiKey
        switch self {
        case .convertingCurrencies(let baseCurrency, let targetCurrency, let date, let baseAmount):
            return "/v1/convert?api_key=\(apiKey)&base=\(baseCurrency.rawValue)&target=\(targetCurrency.rawValue)&date=\(date)&base_amount=\(baseAmount)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .convertingCurrencies:
            return .get
        }
    }
}
