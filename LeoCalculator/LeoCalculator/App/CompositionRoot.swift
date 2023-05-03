//
//  CompositionRoot.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//

import Foundation

final class CompositionRoot {
    
    static let shared = CompositionRoot()
    
    lazy var rcManager: RCManagerInterface = {
        return RCManager.shared
    }()
    
    lazy var themeManager: ThemeManager = {
        return ThemeManager.shared
    }()
    
    lazy var hiddenModel: HomeHiddenModel = {
        return HomeHiddenModel(addIsHidden: self.rcManager.bool(forKey: .isAddButtonEnabled),
                               subtractIsHidden: self.rcManager.bool(forKey: .isSubtractButtonEnabled),
                               multiplyIsHidden: self.rcManager.bool(forKey: .isMultiplyButtonEnabled),
                               divideIsHidden: self.rcManager.bool(forKey: .isDivideButtonEnabled),
                               sinIsHidden: self.rcManager.bool(forKey: .isSinButtonEnabled),
                               cosIsHidden: self.rcManager.bool(forKey: .isCosButtonEnabled),
                               bitcoinIsHidden: self.rcManager.bool(forKey: .isBitcoinButtonEnabled))
    }()
    
    private init() { }
}
