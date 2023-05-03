//
//  CompositionRoot.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//

import Foundation

final class CompositionRootContainer {
    let compositionRoot: CompositionRoot = .init()
    
    static let shared = CompositionRootContainer()
    
    private init() { }
}

final class CompositionRoot {
    
    lazy var rcManager: RCManagerInterface = {
        return RCManager.shared
    }()
}
