//
//  MoviesDataManager.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/3/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class MoviesDataManager {
    
    static func getMoviesList() -> [Movie] {
        let movie1 = Movie(image: UIImage(imageLiteralResourceName: "it_two"), posterTitle: "It: Chapter two", genre: "Horror / Mystery / Thriller / Supernatural", author: "alexander.evdakov@gmail.com")
        let movie2 = Movie(image: UIImage(imageLiteralResourceName: "alita"), posterTitle: "Alita Battle Angel", genre: "Action / Romance / Adventure / Science Fiction / Thriller / Cyberpunk", author: "")
        let movie3 = Movie(image: UIImage(imageLiteralResourceName: "annabelle"), posterTitle: "Annabelle Comes Home", genre: "Horror / Mystery / Thriller / Supernatural", author: "test@mail.com")
        let movie4 = Movie(image: UIImage(imageLiteralResourceName: "rocketman"), posterTitle: "Rocketman", genre: "Drama / Musical / Biography / Fantasy", author: "test@mail.com")
        let movie5 = Movie(image: UIImage(imageLiteralResourceName: "spiderman"), posterTitle: "SPIDER-MAN: into the spider-verse", genre: "Animation / Action / Advanture / Sciene Fiction / Superhero / Fantasy", author: "test@mail.com")
        let movie6 = Movie(image: UIImage(imageLiteralResourceName: "star"), posterTitle: "A Star Is Born", genre: "Romance / Musical / Drama / Music Genre", author: "alexander.evdakov@gmail.com")
        let movie7 = Movie(image: UIImage(imageLiteralResourceName: "enemy"), posterTitle: "Enemy", genre: "Mystery / Thriller / Erotic Thriller", author: "test@mail.com")
        let movie8 = Movie(image: UIImage(imageLiteralResourceName: "shawshank"), posterTitle: "The Shawshank Eedemption", genre: "Drama / Mystery / Crime Fiction", author: "test@mail.com")
        let movie9 = Movie(image: UIImage(imageLiteralResourceName: "midway"), posterTitle: "Midway", genre: "War / Drama / Historical Fiction / Action / Adventure / Epic", author: "test@mail.com")
        let movie10 = Movie(image: UIImage(imageLiteralResourceName: "blue"), posterTitle: "Blue In The Warmest Color", genre: "Drama", author: "test@mail.com")
        let movie11 = Movie(image: UIImage(imageLiteralResourceName: "i_can_only_imagine"), posterTitle: "I Can Only Imagine", genre: "Drama / Famile / Musical", author: "test@mail.com")
        let movie12 = Movie(image: UIImage(imageLiteralResourceName: "venom"), posterTitle: "Venom", genre: "Horror / Thriller / Superhero / Action / Adventure / Sciene function", author: "test@mail.com")
        let movie13 = Movie(image: UIImage(imageLiteralResourceName: "grinch"), posterTitle: "Grinch", genre: "Animation / Family / Musical / Comedy / Fantasy", author: "test@mail.com")
        let movie14 = Movie(image: UIImage(imageLiteralResourceName: "deadpool_two"), posterTitle: "Deadpool 2", genre: "Comedy / Adventure / Syperhero / Action / Sciene Fiction / Fantasy", author: "test@mail.com")
        let movie15 = Movie(image: UIImage(imageLiteralResourceName: "mortal_engines"), posterTitle: "Mortal Engines", genre: "Yong Adult Fiction / Steampunk", author: "test@mail.com")
         
        let moviesList: [Movie] = [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10, movie11, movie12, movie13, movie14, movie15]
        
        return setAutohorItemsOnTop(movies: moviesList)
    }
    
    private static func setAutohorItemsOnTop(movies: [Movie]) -> [Movie] {
        var sortMovies = movies
        var currentIndex = -1;
        let userCoreData = UserCoreDataManager()
        let authorEmail = userCoreData.getUserEmail()
        
        for movie in movies {
            currentIndex += 1
            if (movie.author == authorEmail) {
                let tempMovie: Movie = movie
                sortMovies.remove(at: currentIndex)
                sortMovies.insert(tempMovie, at: 0)
            }
        }
        
        return sortMovies
    }
    
}
