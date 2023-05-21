//
//  SwiftMessagesManager.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 6.05.2023.
//

import SwiftMessages
import UIKit

final class SwiftMessagesManager {
    func showForever(view: UIView, dimColor: UIColor? = .gray.withAlphaComponent(0.8), presentationStyle: SwiftMessages.PresentationStyle = .center, interactive: Bool = false) {
        var config = SwiftMessages.defaultConfig
        config.duration = .forever
        if let dimColor = dimColor {
            config.dimMode = .color(color: dimColor, interactive: interactive)
        }
        config.presentationStyle = presentationStyle
        SwiftMessages.show(config: config, view: view)
    }
    
    func showForever(with defaultAppPopupState: DefaultAppPopupState) {
        var config = SwiftMessages.defaultConfig
        config.duration = .forever
        config.presentationStyle = .center
        config.dimMode = .color(color: .gray.withAlphaComponent(0.8), interactive: false)
        
        let view = AppPopupView()
        let model = defaultAppPopupState.model
        view.configure(with: model)
        
        SwiftMessages.show(config: config, view: view)
    }
    
    func showForever(with model: AppPopupViewModel) {
        var config = SwiftMessages.defaultConfig
        config.duration = .forever
        config.presentationStyle = .center
        config.dimMode = .color(color: .gray.withAlphaComponent(0.8), interactive: false)
        
        let view = AppPopupView()
        view.configure(with: model)
        
        SwiftMessages.show(config: config, view: view)
    }
    
    func hide() {
        SwiftMessages.hide()
    }
}
