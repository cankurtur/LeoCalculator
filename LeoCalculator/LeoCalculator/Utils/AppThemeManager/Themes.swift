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
    var numpadBackgroundColor: UIColor  = .gray
    
    var basicOperationTextColor: UIColor = .black
    var basicOperationBackgroundColor: UIColor = .systemOrange
    
    var extraOperationTextColor: UIColor = .systemOrange
    var extraOperationBackgroundColor: UIColor = .darkGray
    
    var clearTextColor: UIColor = .black
    var clearBackgroundColor: UIColor = .darkGray
    
    var equalTextColor: UIColor = .black
    var equalBackgroundColor: UIColor = .darkGray
}

struct RedTheme: ThemeProtocol {
    var backgroundColor: UIColor = .black
    
    var resultTextColor: UIColor = .systemRed
    
    var numpadTextColor: UIColor = .systemRed
    var numpadBackgroundColor: UIColor  = .gray
    
    var basicOperationTextColor: UIColor = .white
    var basicOperationBackgroundColor: UIColor = .systemRed
    
    var extraOperationTextColor: UIColor = .systemRed
    var extraOperationBackgroundColor: UIColor = .darkGray
    
    var clearTextColor: UIColor = .black
    var clearBackgroundColor: UIColor = .darkGray
    
    var equalTextColor: UIColor = .black
    var equalBackgroundColor: UIColor = .darkGray
}
