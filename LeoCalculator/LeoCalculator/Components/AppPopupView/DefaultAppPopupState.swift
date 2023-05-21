//
//  DefaultAppPopupState.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 6.05.2023.
//

import Foundation

// MARK: - DefaultAppPopupState

enum DefaultAppPopupState {
    case defaultPopup(title: String,
                      message: String,
                      buttonTitle: String,
                      action: (() -> Void)?)
    case networkErrorPopup(message: String, action: (() -> Void)?)
    
    var model: AppPopupViewModel {
        switch self {
        case .defaultPopup(let title, let message, let buttonTitle, let action):
            return AppPopupViewModel(title: title,
                                     description: message,
                                     buttonTitle: buttonTitle) {
                SwiftMessagesManager().hide()
                action?()
            }
            
        case .networkErrorPopup(let message, let action):
            return AppPopupViewModel(title: Localizable.appPopupViewError,
                                     description: message,
                                     buttonTitle: Localizable.appPopupViewOk) {
                SwiftMessagesManager().hide()
                action?()
            }
        }
    }
}
