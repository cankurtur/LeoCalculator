//
//  BaseURL.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import Foundation

enum BaseURL: String {
    case abstractAPIBaseUrl
    
    var url: String {
        switch self {
        case .abstractAPIBaseUrl:
            return Config.shared.abstractAPIBaseUrl
        }
    }
}
