//
//  RCManagerTests.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import XCTest
@testable import LeoCalculator

final class RCManagerTests: XCTestCase {
    private var sut: MockRCManager!
    
    override func setUp() {
        sut = MockRCManager.sharedMock
    }
    
    func test_fetchRCValues_success() {
        // Given
        XCTAssertFalse(sut.isFetchRCValuesCalled)
        // When
        sut.fetchRCValues { _ in
            
        }
        // Then
        XCTAssertTrue(sut.isFetchRCValuesCalled)
    }

    func test_bool_success() {
        // Given
        XCTAssertFalse(sut.isBoolCalled)
        let mockKey = ValueKey.isAddButtonEnabled
        let expectedResult = true
        // When
        let result = sut.bool(forKey: mockKey)
        // Then
        XCTAssertTrue(sut.isBoolCalled)
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_string_success() {
        // Given
        XCTAssertFalse(sut.isStringCalled)
        let mockKey = ValueKey.isAddButtonEnabled
        let expectedResult = "zero"
        // When
        let result = sut.string(forKey: mockKey)
        // Then
        XCTAssertTrue(sut.isStringCalled)
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_double_success() {
        // Given
        XCTAssertFalse(sut.isDoubleCalled)
        let mockKey = ValueKey.isAddButtonEnabled
        let expectedResult = 0.0
        // When
        let result = sut.double(forKey: mockKey)
        // Then
        XCTAssertTrue(sut.isDoubleCalled)
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_data_success() {
        // Given
        XCTAssertFalse(sut.isDataCalled)
        let mockKey = ValueKey.isAddButtonEnabled
        let expectedDataCount = 20
        // When
        let result = sut.data(forKey: mockKey).count
        // Then
        XCTAssertTrue(sut.isDataCalled)
        XCTAssertEqual(expectedDataCount, result)
    }
    
    func test_getFetchDuration_success() {
        // Given
        XCTAssertFalse(sut.isGetFetchDurationCalled)
        let expectedDuration = 0.0
        // When
        let result = sut.getFetchDuration()
        // Then
        XCTAssertTrue(sut.isGetFetchDurationCalled)
        XCTAssertEqual(expectedDuration, result)
    }
}
