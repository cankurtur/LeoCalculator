//
//  Config.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import Foundation

private enum Keys: String {
    case abstractAPIApiKey
    case abstractAPIBaseUrl
}

final class Config: NSObject {
  
    static let shared: Config = Config()
    
    private var configs: NSDictionary!
    
    override private init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Config")!
        let path = Bundle.main.path(forResource: "Config", ofType: "plist")!
        configs = (NSDictionary(contentsOfFile: path)!.object(forKey: currentConfiguration) as! NSDictionary)
    }
}

extension Config {
    var abstractAPIApiKey: String {
        return configs.object(forKey: Keys.abstractAPIApiKey.rawValue) as! String
    }
    
    var abstractAPIBaseUrl: String {
        return configs.object(forKey: Keys.abstractAPIBaseUrl.rawValue) as! String
    }
}
