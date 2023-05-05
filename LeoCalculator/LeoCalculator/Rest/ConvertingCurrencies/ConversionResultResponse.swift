//
//  ConversionResultResponse.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import Foundation

// MARK: - ConversionResultResponse

struct ConversionResultResponse: Codable {
    let base, target: String?
    let baseAmount, convertedAmount: Float?
    let exchangeRate: Float?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case base, target
        case baseAmount = "base_amount"
        case convertedAmount = "converted_amount"
        case exchangeRate = "exchange_rate"
        case date
    }
}
