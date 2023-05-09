//
//  HomeInteractor.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
@testable import LeoCalculator

final class MockHomeInteractor: HomeInteractorInterface {
    var isGetConversionResultCalled: Bool = false
    
    weak var output: HomeInteractorOutput?
    
    func getConversionResult(amount: Float, date: String) {
        isGetConversionResultCalled = true
    }

}
