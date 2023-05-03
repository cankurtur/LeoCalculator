//
//  AppDelegate.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit
import FirebaseCore
import FirebaseRemoteConfig

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirebase()
        setupRCManager()
        return true
    }
    
    private func setupFirebase() {
        FirebaseApp.configure()
    }
    
    private func setupRCManager() {
        CompositionRoot.shared.rcManager.fetchRCValues { _ in }
    }
}
