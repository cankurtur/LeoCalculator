//
//  HomeViewController.swift
//  LeoCalculatorTests
//
//  Created by Can Kurtur on 8.05.2023.
//

import Foundation
@testable import LeoCalculator

final class MockHomeViewController: HomeViewInterface {
    var isPrepareUICalled: Bool = false
    var isSetResultLabelCalled: Bool = false
    var isUpdateUICalled: Bool = false
    var isShowHUDCalled: Bool = false
    
    func prepareUI() {
        isPrepareUICalled = true
    }
    
    func setResultLabel(with result: String) {
        isSetResultLabelCalled = true
    }
    
    func updateUI(theme: Theme) {
        isUpdateUICalled = true
    }
    
    func showHUD() {
        isShowHUDCalled = true
    }
    
    func updateButtonsHiddenity(with hiddenModel: HomeHiddenModel) { }
    func showPopup(title: String, message: String, buttonTitle: String, buttonAction: (() -> Void)?) { }
    func showPopup(error: APIClientError, buttonAction: (() -> Void)?) { }
    func showHUD(text: String, onMainThread: Bool) {  }
    func dismissHUD() {  }
}
