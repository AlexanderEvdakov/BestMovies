//
//  MoviesTableViewModel.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/4/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

final class MoviesTableViewModel {
    
    func isAuthorMovieCard(movieAuthorEmail: String) -> Bool {
        let userCoreData = UserCoreDataManager()
        let authorEmail = userCoreData.getUserEmail()
        
        if movieAuthorEmail == authorEmail {
            return true
        } else {
            return false
        }
    }
    
    func signOut(navigationController: UINavigationController) {
        let userCoreDateManager = UserCoreDataManager()
        userCoreDateManager.deleteUser()
        
        navigationController.popViewController(animated: true)
    }

}
