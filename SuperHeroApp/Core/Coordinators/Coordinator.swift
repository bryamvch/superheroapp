//
//  Coordinator.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController { get set }
}

extension Coordinator {
    func addChildCoordinator(childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }

    func removeChildCoordinator(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}
