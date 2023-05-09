//
//  MockThemeManager.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
@testable import LeoCalculator

final class MockThemeManager: ThemeManagerInterface {
   
    static let sharedMock = MockThemeManager()
    
    var currentTheme: Theme = .original
    var isChangeCurrentThemeCalled: Bool = false
    var isGetCurrentThemeCalled: Bool = false
    
    func changeCurrentTheme(with theme: Theme) {
        isChangeCurrentThemeCalled = true
        currentTheme = theme
    }
    
    func getCurrentTheme() -> Theme {
        isGetCurrentThemeCalled = true
        return .original
    }
}
