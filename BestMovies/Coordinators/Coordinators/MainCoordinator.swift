//
//  MainCoordinator.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 9/30/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, AccountCreating, NavigateToMoviesTableViewAction {    
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instatiate()
        
        vc.createAccountAction = { [weak self] in
            self?.createAccount()
        }
        
        vc.navigateToMoviesTableView = { [weak self] in
            self?.navigateToMoviesTableView()
        }
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func createAccount() {
        let child = SignUpCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigateToMoviesTableView() {
//        let vc = MoviesTableViewController.instatiate()
//        navigationController.pushViewController(vc, animated: true)
        
        let child = MoviesCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
}
