//
//  Themes.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//


import UIKit

struct OriginalTheme: ThemeProtocol {
    var backgroundColor: UIColor = .black
    var resultTextColor: UIColor = .white
    var numpadTextColor: UIColor = .white
    var numpadBackgroundColor: UIColor  = .appLightGray()
    var basicOperationTextColor: UIColor = .white
    var basicOperationBackgroundColor: UIColor = .appOrange()
    var extraOperationTextColor: UIColor = .appOrange()
    var extraOperationBackgroundColor: UIColor = .appDarkGray()
    var clearTextColor: UIColor = .black
    var clearBackgroundColor: UIColor = .appDarkGray()
    var equalTextColor: UIColor = .white
    var equalBackgroundColor: UIColor = .appDarkGray()
}

struct RedTheme: ThemeProtocol {
    var backgroundColor: UIColor = .black
    var resultTextColor: UIColor = .white
    var numpadTextColor: UIColor = .white
    var numpadBackgroundColor: UIColor  = .appLightGray()
    var basicOperationTextColor: UIColor = .white
    var basicOperationBackgroundColor: UIColor = .appRed()
    var extraOperationTextColor: UIColor = .appRed()
    var extraOperationBackgroundColor: UIColor = .appDarkGray()
    var clearTextColor: UIColor = .black
    var clearBackgroundColor: UIColor = .appDarkGray()
    var equalTextColor: UIColor = .white
    var equalBackgroundColor: UIColor = .appDarkGray()
}
