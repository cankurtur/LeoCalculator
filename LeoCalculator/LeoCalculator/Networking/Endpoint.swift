//
//  Endpoint.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import Foundation
import LeoNetworking

extension Endpoint {
    var baseUrl: String {
        return BaseURL.abstractAPIBaseUrl.url
    }
    
    var params: [String: Any]? {
        return nil
    }
    
    var url: String {
        return "\(baseUrl)\(path)"
    }
    
    var headers: HTTPHeaders? {
        var headers = baseHeaders
        return headers
    }
}
