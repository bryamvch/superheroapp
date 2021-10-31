//
//  AppCoordinator.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension AppCoordinator {
    func start() {
        let vc = HomeViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}
