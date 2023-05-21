//
//  HUDManager.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import MBProgressHUD

// MARK: - HUDManager

final class HUDManager {
    
    func showHUD(text: String, onMainThread: Bool = false, viewController: UIViewController) {
        if onMainThread {
            let progressHUD = MBProgressHUD.showAdded(to: viewController.view, animated: true)
            progressHUD.mode = .indeterminate
            progressHUD.label.text = text
            progressHUD.label.font = UIFont.systemFont(ofSize: 14)
        } else {
            DispatchQueue.main.async {
                let progressHUD = MBProgressHUD.showAdded(to: viewController.view, animated: true)
                progressHUD.mode = .indeterminate
                progressHUD.label.text = text
                progressHUD.label.font = UIFont.systemFont(ofSize: 14)
            }
        }
    }

    func dismissHUD(isAnimated: Bool = true, viewController: UIViewController) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: viewController.view, animated: isAnimated)
        }
    }
}
