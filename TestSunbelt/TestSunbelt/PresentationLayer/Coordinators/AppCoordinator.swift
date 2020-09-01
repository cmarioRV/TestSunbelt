//
//  AppCoordinator.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    //    var childCoordinators : [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showDashboard()
    }
    
    func showDashboard() {
        let coordinator = DashboardCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        //        childCoordinators.append(coordinator)
        add(child: coordinator)
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func finish(coordinator: Coordinator) {
        remove(child: coordinator)
        showDashboard()
    }
}

extension AppCoordinator: ProspectsCoordinatorDelegate {
    func closeSession(coordinator: Coordinator) {
        remove(child: coordinator)
        AppParams.setUserIsLogged(isLogged: false)
        showLogin()
    }
}
