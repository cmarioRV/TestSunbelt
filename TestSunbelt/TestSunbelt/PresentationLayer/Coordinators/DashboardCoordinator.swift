//
//  DashboardCoordinator.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

class DashboardCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProspectsViewModel(domain: domain)
        let viewController = ProspectsTableViewController(viewModel: viewModel)
        viewController.delegate = self
        //        let viewController = storyboard.instantiateViewController(withIdentifier: "prospects")
        navigationController.viewControllers = [viewController]
    }
}
