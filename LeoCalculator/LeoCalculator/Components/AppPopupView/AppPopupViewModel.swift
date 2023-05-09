//
//  AppPopupViewModel.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 6.05.2023.
//

import Foundation

// MARK: - AppPopupViewModel

struct AppPopupViewModel {
    let title: String
    let description: String
    let buttonTitle: String
    let buttonAction: (() -> Void)?
}
