//
//  MockNetworkManager.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
import LeoNetworking

@testable import LeoCalculator

final class MockNetworkManager: NetworkManagerProtocol {
    
    func request<T>(endpoint: some LeoNetworking.Endpoint, responseType: T.Type, completion: @escaping LeoNetworking.NetworkHandler<T>) where T : Decodable {
        return
    }
    
    func request<T>(endpoint: some LeoNetworking.Endpoint, responseType: T.Type) async throws -> T where T : Decodable {
        return ClientError.self as! T
    }

}
