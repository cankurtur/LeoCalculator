//
//  NSNotificationExtension.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 7.05.2023.
//

import Foundation

extension NSNotification.Name {
    static let shouldUpdateHomeButtons = NSNotification.Name(rawValue: "shouldUpdateHomeButtons")
}

protocol NotificationCenterProtocol {
    func add(observer: Any, selector: Selector, name: NSNotification.Name, object: Any?)
    func removeWith(_ observer: Any)
    func removeObserverWithName(with observer: Any, name: Notification.Name, object: Any?)
    func post(with name: NSNotification.Name, object: Any?)
    func post(with name: NSNotification.Name, object: Any?, userInfo: [AnyHashable: Any]?)
}
 
extension NotificationCenter: NotificationCenterProtocol {
    func add(observer: Any, selector: Selector, name: NSNotification.Name, object: Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    func removeWith(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    func removeObserverWithName(with observer: Any, name: Notification.Name, object: Any?) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
    }
    
    func post(with name: NSNotification.Name, object: Any?) {
        NotificationCenter.default.post(name: name, object: object, userInfo: nil)
    }

    func post(with name: NSNotification.Name, object: Any?, userInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
}
