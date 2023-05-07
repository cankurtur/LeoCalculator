//
//  CompositionRoot.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//

import Foundation
import LeoNetworking

final class CompositionRoot {
    
    static let shared = CompositionRoot()
    
    lazy var networkManager: NetworkManagerProtocol = {
        return NetworkManager(
            clientErrorType: ClientError.self
        )
    }()
    
    lazy var rcManager: RCManagerInterface = {
        return RCManager.shared
    }()
    
    lazy var themeManager: ThemeManager = {
        return ThemeManager.shared
    }()
    
    lazy var notificationCenter: NotificationCenterProtocol = {
        return NotificationCenter.default
    }()
    
    private init() { }
}
