//
//  HomeInteractor.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 1.05.2023.
//

import Foundation

// MARK: - InteractorInterface

protocol HomeInteractorInterface: InteractorInterface { }

// MARK: - HomeInteractorOutput

protocol HomeInteractorOutput: AnyObject { }

// MARK: - HomeInteractor

final class HomeInteractor {
    weak var output: HomeInteractorOutput?
}

// MARK: - HomeInteractorInterface
extension HomeInteractor: HomeInteractorInterface { }
