//
//  ThemeManager.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 4.05.2023.
//

import Foundation

// MARK: - ThemeManager

final class ThemeManager {
    static let shared: ThemeManager = ThemeManager()
    
    private var currentTheme: Theme
    
    private init() {
        currentTheme = .original
    }
    
    func changeCurrentTheme(with theme: Theme) {
        switch theme {
        case .original:
            self.currentTheme = theme
        case .red:
            self.currentTheme = theme
        }
    }
    
    func getCurrentTheme() -> Theme {
        return currentTheme
    }
}
