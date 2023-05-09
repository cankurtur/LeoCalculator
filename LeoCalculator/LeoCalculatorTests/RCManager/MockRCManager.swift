//
//  MockRCManager.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
@testable import LeoCalculator

final class MockRCManager: RCManagerInterface {
    static let sharedMock = MockRCManager()
    
    var isFetchRCValuesCalled: Bool = false
    var isBoolCalled: Bool = false
    var isStringCalled: Bool = false
    var isDoubleCalled: Bool = false
    var isIntegerCalled: Bool = false
    var isDataCalled: Bool = false
    var isGetFetchDurationCalled: Bool = false
    
    func fetchRCValues(completion: @escaping (Bool) -> Void) {
        isFetchRCValuesCalled = true
        return
    }
    
    func bool(forKey key: ValueKey) -> Bool {
        isBoolCalled = true
        return true
    }
    
    func string(forKey key: ValueKey) -> String {
        isStringCalled = true
        return "zero"
    }
    
    func double(forKey key: ValueKey) -> Double {
        isDoubleCalled = true
        return 0.0
    }
    
    func integer(forKey key: ValueKey) -> Int {
        isIntegerCalled = true
        return 0
    }
    
    func data(forKey key: ValueKey) -> Data {
        isDataCalled = true
        return Data(count: 20)
    }
    
    func getFetchDuration() -> Double {
        isGetFetchDurationCalled = true
        return 0.0
    }
}
