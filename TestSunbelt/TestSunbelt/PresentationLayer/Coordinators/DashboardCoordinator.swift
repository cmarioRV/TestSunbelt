//
//  DashboardCoordinator.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardCoordinatorDelegate: class {
    func finish(coordinator: Coordinator)
}

class DashboardCoordinator: Coordinator {
    
    weak var delegate: DashboardCoordinatorDelegate?
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let viewModel = AppDelegate.diContainer.resolve(BreedsViewModelType.self) else { return }
        let viewController = BreedsViewController(viewModel)
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }
    
    func showBreedDetail(_ name: String) {
        guard let viewModel = AppDelegate.diContainer.resolve(BreedDetailViewModelType.self) else { return }
        let viewController = BreedDetailViewController(viewModel, name: name)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension DashboardCoordinator: BreedsViewControllerDelegate {
    func cellSelected(name: String) {
        showBreedDetail(name)
    }
}
