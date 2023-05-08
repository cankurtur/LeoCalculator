//
//  NotificationCenterTests.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import XCTest
@testable import LeoCalculator

final class NotificationCenterTests: XCTestCase {
    private var sut: MockNotificationCenter!
    
    override func setUp() {
        sut = MockNotificationCenter()
    }
    
    @objc func mockSelectorMethod() {
        
    }
    
    func test_add_success() {
        // Given
        XCTAssertFalse(sut.isAddCalled)
        // When
        sut.add(observer: self, selector: #selector(mockSelectorMethod), name: .shouldUpdateHomeButtons, object: nil)
        // Then
        XCTAssertTrue(sut.isAddCalled)
    }
    
    
    func test_removeWith_success() {
        // Given
        XCTAssertFalse(sut.isRemoveWithCalled)
        // When
        sut.removeWith(self)
        // Then
        XCTAssertTrue(sut.isRemoveWithCalled)
    }
    
    
    func test_removeObserverWithName_success() {
        // Given
        XCTAssertFalse(sut.isRemoveObserverWithNameCalled)
        // When
        sut.removeObserverWithName(with: self, name: .shouldUpdateHomeButtons, object: nil)
        // Then
        XCTAssertTrue(sut.isRemoveObserverWithNameCalled)
    }
    
    func test_post_success() {
        // Given
        XCTAssertFalse(sut.isPostCalled)
        // When
        sut.post(with: .shouldUpdateHomeButtons, object: nil)
        // Then
        XCTAssertTrue(sut.isPostCalled)
    }
    
    func test_postWithObject_success() {
        // Given
        XCTAssertFalse(sut.isPostWithObjectCalled)
        // When
        sut.post(with: .shouldUpdateHomeButtons, object: nil, userInfo: nil)
        // Then
        XCTAssertTrue(sut.isPostWithObjectCalled)
    }
}
