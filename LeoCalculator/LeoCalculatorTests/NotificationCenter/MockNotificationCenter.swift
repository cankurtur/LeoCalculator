//
//  MockNotificationCenter.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
@testable import LeoCalculator

class MockNotificationCenter: NotificationCenterProtocol {
    
    var isAddCalled: Bool = false
    var isRemoveWithCalled: Bool = false
    var isRemoveObserverWithNameCalled: Bool = false
    var isPostCalled: Bool = false
    var isPostWithObjectCalled: Bool = false
    
    var observer: Any?
    var selector: Selector?
    var name: NSNotification.Name?
    var object: Any?
    var userInfo: [AnyHashable: Any]?
    
    func add(observer: Any, selector: Selector, name: NSNotification.Name, object: Any?) {
        isAddCalled = true
        self.observer = observer
        self.selector = selector
        self.name = name
        self.object = object
    }
    
    func removeWith(_ observer: Any) {
        isRemoveWithCalled = true
        self.observer = observer
        self.name = nil
        self.object = nil
    }
    
    func removeObserverWithName(with observer: Any, name: Notification.Name, object: Any?) {
        isRemoveObserverWithNameCalled = true
        self.observer = observer
        self.name = name
        self.object = object
    }
    
    func post(with name: NSNotification.Name, object: Any?) {
        isPostCalled = true
        self.name = name
        self.object = object
        self.userInfo = nil
    }
    
    func post(with name: NSNotification.Name, object: Any?, userInfo: [AnyHashable: Any]?) {
        isPostWithObjectCalled = true
        self.name = name
        self.object = object
        self.userInfo = userInfo
    }
}
