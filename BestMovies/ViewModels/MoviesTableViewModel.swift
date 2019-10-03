//
//  MoviesTableViewModel.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/4/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

final class MoviesTableViewModel {
    
    var moviesList: [Movie] = MoviesDataManager.getMoviesList()
    
    func getMoviesList() -> [Movie] {
        return moviesList
    }
    
    func isAuthorMovieCard(movieAuthorEmail: String) -> Bool {
        let userCoreData = UserCoreDataManager()
        let authorEmail = userCoreData.getUserEmail()
        
        if movieAuthorEmail == authorEmail {
            return true
        } else {
            return false
        }
    }

}
