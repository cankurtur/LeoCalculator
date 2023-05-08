//
//  MockCompositionRoot.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
import LeoNetworking

@testable import LeoCalculator

final class MockCompositionRoot: CompositionRootInterface {
    
    static let sharedMock = MockCompositionRoot()

    lazy var networkManager: NetworkManagerProtocol = {
        MockNetworkManager()
    }()
    
    lazy var rcManager: RCManagerInterface = {
        return MockRCManager()
    }()
    
    lazy var themeManager: ThemeManagerInterface = {
        return MockThemeManager()
    }()
    
    lazy var notificationCenter: NotificationCenterProtocol = {
        return MockNotificationCenter()
    }()
    
}
