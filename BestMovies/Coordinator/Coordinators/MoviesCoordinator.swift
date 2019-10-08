//
//  MoviesCoordinator.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/2/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation
import UIKit

class MoviesCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MoviesTableViewController.instatiate()
        
        vc.navigateToProfile = { [weak self] Movie in
            self?.navigateToProfile(movie: vc.selectedMovie!, isNewMovie: vc.isNewMovie)
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToProfile(movie: Movie, isNewMovie: Bool) {
        let vc = ProfileViewController.instatiate()
        vc.movieData = movie
        vc.isNewMovie = isNewMovie
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
