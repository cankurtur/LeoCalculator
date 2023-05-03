//
//  RCManager.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 3.05.2023.
//

import Foundation
import FirebaseRemoteConfig

enum ValueKey: String {
    case isAddButtonEnabled = "isAddButtonEnabled"
    case isSubtractButtonEnabled = "isSubtractButtonEnabled"
    case isMultiplyButtonEnabled = "isMultiplyButtonEnabled"
    case isDivideButtonEnabled = "isDivideButtonEnabled"
    case isSinButtonEnabled = "isSinButtonEnabled"
    case isCosButtonEnabled = "isCosButtonEnabled"
    case isBitcoinButtonEnabled = "isBitcoinButtonEnabled"
    
}
protocol RCManagerInterface {
    func fetchRCValues(completion: @escaping (Bool) -> Void)
    func bool(forKey key: ValueKey) -> Bool
    func string(forKey key: ValueKey) -> String
    func double(forKey key: ValueKey) -> Double
    func integer(forKey key: ValueKey) -> Int
    func data(forKey key: ValueKey) -> Data
    func getFetchDuration() -> Double
}

final class RCManager: RCManagerInterface {
    
    static let shared = RCManager()
    private let remoteConfigSettings = RemoteConfigSettings.init()
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {
        // Don't actually set this 0 in production!
        remoteConfigSettings.minimumFetchInterval = getFetchDuration()
        remoteConfig.configSettings = remoteConfigSettings
    }
    
    func fetchRCValues(completion: @escaping (Bool) -> Void) {
        
        remoteConfig.fetch(withExpirationDuration: getFetchDuration()) { [weak self] (/*status*/_, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                print("Uh-oh. Got an error fetching remote values \(error)")
                completion(true)
                return
            }
            print("Retrieved values from the firebase remote config!")
            strongSelf.remoteConfig.activate { (/*success*/ _, error) in
                if let error = error {
                    print("Values could not be activated: \(error.localizedDescription)")
                    completion(true)
                    return
                }
                print("Values are successfully activated")
                completion(false)
            }
        }
    }
    
    // MARK: Helper methods to retrieve data
    func bool(forKey key: ValueKey) -> Bool {
        return remoteConfig[key.rawValue].boolValue
    }
    
    func string(forKey key: ValueKey) -> String {
        return remoteConfig[key.rawValue].stringValue ?? ""
    }
    
    func double(forKey key: ValueKey) -> Double {
        let numberValue = remoteConfig[key.rawValue].numberValue
        return numberValue.doubleValue
    }
    
    func integer(forKey key: ValueKey) -> Int {
        let numberValue = remoteConfig[key.rawValue].numberValue
        return numberValue.intValue
    }
    
    func data(forKey key: ValueKey) -> Data {
        let dataValue = remoteConfig[key.rawValue].dataValue
        return dataValue
    }
    
    func getFetchDuration() -> Double {
        return 0
    }
}
