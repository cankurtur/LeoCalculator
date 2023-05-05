//
//  ViewInterface.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

public protocol ViewInterface: AnyObject {
    func showHUD()
    func showHUD(text: String, onMainThread: Bool)
    func dismissHUD()
}

public extension ViewInterface where Self: UIViewController {

    func showHUD() {
        HUDManager.shared.showHUD(text: Localizable.hudCalculating, onMainThread: false, viewController: self)
    }
    
    func showHUD(text: String, onMainThread: Bool) {
        HUDManager.shared.showHUD(text: text, onMainThread: onMainThread, viewController: self)
    }
    
    func dismissHUD() {
        HUDManager.shared.dismissHUD(viewController: self)
    }
}
