//
//  Storyboarded.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import UIKit

protocol Storyboarded {
    static var storyboardName: StoryboardNames { get }
    static func instantiate(identifier: String?) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(identifier: String? = nil) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)

        guard let vc = storyboard.instantiateViewController(withIdentifier: identifier ?? self.className) as? Self else {
            fatalError("Storyboard cannot instantiated")
        }

        return vc
    }
}
