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
            var urlComponents = URLComponents()
            urlComponents.path = "/convert"
            urlComponents.queryItems = [URLQueryItem(name: "api_key", value: apiKey),
                                        URLQueryItem(name: "base", value: baseCurrency.rawValue),
                                        URLQueryItem(name: "target", value: targetCurrency.rawValue),
                                        URLQueryItem(name: "date", value: date),
                                        URLQueryItem(name: "base_amount", value: String(baseAmount))
            ]
            
            return urlComponents.url?.absoluteString ?? ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .convertingCurrencies:
            return .get
        }
    }
}
