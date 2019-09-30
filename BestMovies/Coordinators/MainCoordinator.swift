//
//  MainCoordinator.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 9/30/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordonator, AccountCreating {
    var childCoordinators = [Coordonator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instatiate()
        
        vc.createAccountAction = { [weak self] in
            self?.createAccount()
        }
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func createAccount() {
        let vc = SignUpViewController.instatiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
