//
//  ThemeManager.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 4.05.2023.
//

import Foundation

protocol ThemeManagerInterface: AnyObject {
    func changeCurrentTheme(with theme: Theme)
    func getCurrentTheme() -> Theme
}

// MARK: - ThemeManager

final class ThemeManager: ThemeManagerInterface {
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
