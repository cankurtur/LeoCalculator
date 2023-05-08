//
//  CompositionRoot.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//

import Foundation
import LeoNetworking

protocol CompositionRootInterface {
    var networkManager: NetworkManagerProtocol { get set }
    var rcManager: RCManagerInterface { get set }
    var themeManager: ThemeManagerInterface { get set }
    var notificationCenter: NotificationCenterProtocol { get set }
}

final class CompositionRoot: CompositionRootInterface {
    
    static let shared = CompositionRoot()
    
    lazy var networkManager: NetworkManagerProtocol = {
        return NetworkManager(
            clientErrorType: ClientError.self
        )
    }()
    
    lazy var rcManager: RCManagerInterface = {
        return RCManager.shared
    }()
    
    lazy var themeManager: ThemeManagerInterface = {
        return ThemeManager.shared
    }()
    
    lazy var notificationCenter: NotificationCenterProtocol = {
        return NotificationCenter.default
    }()
    
    private init() { }
}
