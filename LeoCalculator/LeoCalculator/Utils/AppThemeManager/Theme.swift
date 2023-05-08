//
//  Themes.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//


import UIKit

// MARK: - Theme

enum Theme {
    case original
    case red
    
    var backgroundColor: UIColor {
        switch self {
        case .original:
            return .black
        case .red:
            return .black
        }
    }
    
    var resultTextColor: UIColor {
        switch self {
        case .original:
            return .white
        case .red:
            return .white
        }
    }
    
    var numpadTextColor: UIColor {
        switch self {
        case .original:
            return .white
        case .red:
            return .white
        }
    }
    
    var numpadBackgroundColor: UIColor {
        switch self {
        case .original:
            return .appLightGray
        case .red:
            return .appLightGray
        }
    }
    
    var basicOperationTextColor: UIColor {
        switch self {
        case .original:
            return .white
        case .red:
            return .white
        }
    }
    
    var basicOperationBackgroundColor: UIColor {
        switch self {
        case .original:
            return .appOrange
        case .red:
            return .appRed
        }
    }
    
    var extraOperationTextColor: UIColor {
        switch self {
        case .original:
            return .appOrange
        case .red:
            return .appRed
        }
    }
    
    var extraOperationBackgroundColor: UIColor {
        switch self {
        case .original:
            return .appDarkGray
        case .red:
            return .appDarkGray
        }
    }
    
    var clearTextColor: UIColor {
        switch self {
        case .original:
            return .black
        case .red:
            return .black
        }
    }
    
    var clearBackgroundColor: UIColor {
        switch self {
        case .original:
            return .appDarkGray
        case .red:
            return .appDarkGray
        }
    }
    
    var equalTextColor: UIColor {
        switch self {
        case .original:
            return .white
        case .red:
            return .white
        }
    }
    
    var equalBackgroundColor: UIColor {
        switch self {
        case .original:
            return .appDarkGray
        case .red:
            return .appDarkGray
        }
    }
}
