//
//  ViewInterface.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

public protocol ViewInterface: AnyObject {
    func showPopup(title: String, message: String, buttonTitle: String, buttonAction: (() -> Void)?)
    func showPopup(error: APIClientError, buttonAction: (() -> Void)?)
    func showHUD()
    func showHUD(text: String, onMainThread: Bool)
    func dismissHUD()
}

public extension ViewInterface where Self: UIViewController {
    
    func showPopup(title: String, message: String, buttonTitle: String, buttonAction: (() -> Void)?) {
        SwiftMessagesManager().showForever(with: .defaultPopup(title: title,
                                                                    message: message,
                                                                    buttonTitle: buttonTitle,
                                                                    action: buttonAction))
    }
    
    func showPopup(error: APIClientError, buttonAction: (() -> Void)?) {
        SwiftMessagesManager().showForever(with: .networkErrorPopup(message: error.message,
                                                                         action: buttonAction))
    }

    func showHUD() {
        HUDManager().showHUD(text: Localizable.hudCalculating, onMainThread: false, viewController: self)
    }
    
    func showHUD(text: String, onMainThread: Bool) {
        HUDManager().showHUD(text: text, onMainThread: onMainThread, viewController: self)
    }
    
    func dismissHUD() {
        HUDManager().dismissHUD(viewController: self)
    }
}
