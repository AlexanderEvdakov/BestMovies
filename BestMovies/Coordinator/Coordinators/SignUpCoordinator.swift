//
//  SignUpCoordinator.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/3/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation
import UIKit

class SignUpCoordinator: Coordinator, NavigateToMoviesTableViewAction {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignUpViewController.instatiate()
        
        vc.navigateToMoviesTableView = { [weak self] in
            self?.navigateToMoviesTableView()
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToMoviesTableView() {
        let vc = MoviesTableViewController.instatiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
