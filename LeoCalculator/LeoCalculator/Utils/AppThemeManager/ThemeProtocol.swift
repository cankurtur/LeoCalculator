//
//  ThemeProtocol.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//

import UIKit

protocol ThemeProtocol {
    
    var backgroundColor: UIColor { get set }
    
    var resultTextColor: UIColor { get set }
    
    var numpadTextColor: UIColor { get set }
    var numpadBackgroundColor: UIColor { get set }
    
    var basicOperationTextColor: UIColor { get set }
    var basicOperationBackgroundColor: UIColor { get set }
    
    var extraOperationTextColor: UIColor { get set }
    var extraOperationBackgroundColor: UIColor { get set }
       
    var clearTextColor: UIColor { get set }
    var clearBackgroundColor: UIColor { get set }
    
    var equalTextColor: UIColor { get set }
    var equalBackgroundColor: UIColor { get set }
}
