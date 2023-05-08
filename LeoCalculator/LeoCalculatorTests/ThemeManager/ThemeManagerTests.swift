//
//  ThemeManagerTests.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 9.05.2023.
//

import XCTest
@testable import LeoCalculator

final class ThemeManagerTests: XCTestCase {
    private var sut: MockThemeManager!
    
    override func setUp() {
        sut = MockThemeManager.sharedMock
    }
    
    func test_changeCurrentTheme_success() {
        // Given
        XCTAssertFalse(sut.isChangeCurrentThemeCalled)
        let expectedTheme: Theme = .red
        // When
        sut.changeCurrentTheme(with: .red)
        // Then
        XCTAssertTrue(sut.isChangeCurrentThemeCalled)
        XCTAssertEqual(expectedTheme, sut.currentTheme)
    }
    
    
    func test_getCurrentTheme_success() {
        // Given
        XCTAssertFalse(sut.isGetCurrentThemeCalled)
        let expectedTheme: Theme = .original
        // When
        let result = sut.getCurrentTheme()
        // Then
        XCTAssertTrue(sut.isGetCurrentThemeCalled)
        XCTAssertEqual(expectedTheme, result)
    }
}
