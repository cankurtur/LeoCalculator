//
//  BaseViewController.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

class BaseViewController: UIViewController {

    var screenName: String {
        return "#" + self.className
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("initialized: ", screenName)
    }
    
    deinit {
        print("deinitialized:", screenName)
    }
}
