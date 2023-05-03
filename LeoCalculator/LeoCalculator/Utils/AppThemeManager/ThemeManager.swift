//
//  ThemeManager.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 4.05.2023.
//

import Foundation

enum Theme {
    case original
    case red
    
    var type: ThemeProtocol {
        switch self {
        case .original:
            return OriginalTheme()
        case .red:
            return RedTheme()
        }
    }
}

final class ThemeManager {
    static let shared: ThemeManager = ThemeManager()
    
    private var current: ThemeProtocol = OriginalTheme()
    
    private init() { }
    
    func changeCurrentTheme(with theme: Theme) {
        switch theme {
        case .original:
            self.current = theme.type
        case .red:
            self.current = theme.type
        }
    }
    
    func getHomeUIModel() -> HomeUIModel {
        return HomeUIModel(backgroundColor: current.backgroundColor,
                           resultTextColor: current.resultTextColor,
                           numpadTextColor: current.numpadTextColor,
                           numpadBackgroundColor: current.numpadBackgroundColor,
                           basicOperationTextColor: current.basicOperationTextColor,
                           basicOperationBackgroundColor: current.basicOperationBackgroundColor,
                           extraOperationTextColor: current.extraOperationTextColor,
                           extraOperationBackgroundColor: current.extraOperationBackgroundColor,
                           clearTextColor: current.clearTextColor,
                           clearBackgroundColor: current.clearBackgroundColor,
                           equalTextColor: current.equalTextColor,
                           equalBackgroundColor: current.equalBackgroundColor
        )
    }
}
