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
        let movie1 = Movie(id: 0, image: "it_two", posterTitle: "It: Chapter two", genre: "Horror / Mystery / Thriller / Supernatural", author: "alexander.evdakov@gmail.com", reviewMessage: "", budget: "$79 million", releaseData: "")
        let movie2 = Movie(id: 1, image: "alita", posterTitle: "Alita Battle Angel", genre: "Action / Romance / Adventure / Science Fiction / Thriller / Cyberpunk", author: "pupok@gmail.com", reviewMessage: "", budget: "$170 million", releaseData: "")
        let movie3 = Movie(id: 2, image: "annabelle", posterTitle: "Annabelle Comes Home", genre: "Horror / Mystery / Thriller / Supernatural", author: "test@mail.com", reviewMessage: "", budget: "$27-32 million", releaseData: "")
        let movie4 = Movie(id: 3, image: "rocketman", posterTitle: "Rocketman", genre: "Drama / Musical / Biography / Fantasy", author: "test@mail.com", reviewMessage: "", budget: "$40 million", releaseData: "")
        let movie5 = Movie(id: 4, image: "spiderman", posterTitle: "SPIDER-MAN: into the spider-verse", genre: "Animation / Action / Advanture / Sciene Fiction / Superhero / Fantasy", author: "test@mail.com", reviewMessage: "", budget: "$90 million", releaseData: "")
        let movie6 = Movie(id: 5, image: "star", posterTitle: "A Star Is Born", genre: "Romance / Musical / Drama / Music Genre", author: "alexander.evdakov@gmail.com", reviewMessage: "", budget: "$36 million", releaseData: "")
        let movie7 = Movie(id: 6, image: "enemy", posterTitle: "Enemy", genre: "Mystery / Thriller / Erotic Thriller", author: "test@mail.com", reviewMessage: "", budget: "$40 million", releaseData: "")
        let movie8 = Movie(id: 7, image: "shawshank", posterTitle: "The Shawshank Eedemption", genre: "Drama / Mystery / Crime Fiction", author: "test@mail.com", reviewMessage: "", budget: "$25 million", releaseData: "")
        let movie9 = Movie(id: 8, image: "midway", posterTitle: "Midway", genre: "War / Drama / Historical Fiction / Action / Adventure / Epic", author: "test@mail.com", reviewMessage: "", budget: "$59.5 million", releaseData: "")
        let movie10 = Movie(id: 9, image: "blue", posterTitle: "Blue In The Warmest Color", genre: "Drama", author: "test@mail.com", reviewMessage: "", budget: "$4 million", releaseData: "")
        let movie11 = Movie(id: 10, image: "i_can_only_imagine", posterTitle: "I Can Only Imagine", genre: "Drama / Famile / Musical", author: "test@mail.com", reviewMessage: "", budget: "$7 million", releaseData: "")
        let movie12 = Movie(id: 11, image: "venom", posterTitle: "Venom", genre: "Horror / Thriller / Superhero / Action / Adventure / Sciene function", author: "test@mail.com", reviewMessage: "", budget: "$100-116 million", releaseData: "")
        let movie13 = Movie(id: 12, image: "grinch", posterTitle: "Grinch", genre: "Animation / Family / Musical / Comedy / Fantasy", author: "test@mail.com", reviewMessage: "", budget: "$75 million", releaseData: "")
        let movie14 = Movie(id: 13, image: "deadpool_two", posterTitle: "Deadpool 2", genre: "Comedy / Adventure / Syperhero / Action / Sciene Fiction / Fantasy", author: "test@mail.com", reviewMessage: "", budget: "$110 million", releaseData: "")
        let movie15 = Movie(id: 14, image: "mortal_engines", posterTitle: "Mortal Engines", genre: "Yong Adult Fiction / Steampunk", author: "test@mail.com", reviewMessage: "", budget: "$100-150 million", releaseData: "")
         
        let moviesList: [Movie] = [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10, movie11, movie12, movie13, movie14, movie15]
        
        return moviesList
    }
    
    func setAutohorItemsOnTop(movies: [Movie]) -> [Movie] {
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
