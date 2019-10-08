//
//  MovieCoreDataManager.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/17/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import CoreData
import UIKit.UIApplication

class MovieCoreDataManager {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func addInitialMovieData() {
        let context = appDelegate!.persistentContainer.viewContext
        
        let moviesData = MoviesDataManager.getMoviesList()
        
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        
        do {
            let result = try context.fetch(request)

            if (result.count >= 1) {
                return
            } else {
                let movieEntity = NSEntityDescription.entity(forEntityName: "MovieDataBase", in: context)!

                for i in 0...14 {
                    let movieDataBase = NSManagedObject(entity: movieEntity, insertInto: context)
                    
                    movieDataBase.setValue(moviesData[i].id, forKey: "id")
                    movieDataBase.setValue(moviesData[i].poster, forKey: "poster")
                    movieDataBase.setValue(moviesData[i].posterTitle, forKey: "posterTitle")
                    movieDataBase.setValue(moviesData[i].movieGenre, forKey: "movieGenre")
                    movieDataBase.setValue(moviesData[i].author, forKey: "author")
                    movieDataBase.setValue(moviesData[i].reviewMessage, forKey: "reviewMessage")
                    movieDataBase.setValue(moviesData[i].budget, forKey: "budget")
                    movieDataBase.setValue(moviesData[i].releaseDate, forKey: "releaseDate")
                }
            }

            do {
                try context.save()
            } catch {
                print("fail")
            }
        } catch {
            print("fail")
        }
    }
    
    func getAllMoviesFromLibrary() -> [Movie] {
        var movies: [Movie] = []
        var moviesLibrary: [Movie] = []
        
        let moviesDataManager = MoviesDataManager()
        
        let context = appDelegate!.persistentContainer.viewContext
                
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        
        do {
            let result = try context.fetch(request)

            for data in result {
                let newMovie = Movie(id: Int(data.id), image: data.poster!, posterTitle: data.posterTitle!, genre: data.movieGenre!, author: data.author!, reviewMessage: data.reviewMessage!, budget: data.budget!, releaseData: data.releaseDate!)
                moviesLibrary.append(newMovie)
            }
            
            movies = moviesDataManager.setAutohorItemsOnTop(movies: moviesLibrary)
        } catch {
            print("fail")
        }
        
        return movies
    }
    
    func updateMovieData(newData: Movie) {
        let context = appDelegate!.persistentContainer.viewContext
                
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        
        do {
            let movies = try context.fetch(request)
            
            var index: Int = -1
            for movie in movies {
                index += 1
                
                if Int(movie.id) == newData.id {
                    let movieForUpdate = movies[index] as NSManagedObject
                    
                    movieForUpdate.setValue(newData.id, forKey: "id")
                    movieForUpdate.setValue(newData.poster, forKey: "poster")
                    movieForUpdate.setValue(newData.posterTitle, forKey: "posterTitle")
                    movieForUpdate.setValue(newData.movieGenre, forKey: "movieGenre")
                    movieForUpdate.setValue(newData.author, forKey: "author")
                    movieForUpdate.setValue(newData.reviewMessage, forKey: "reviewMessage")
                    movieForUpdate.setValue(newData.budget, forKey: "budget")
                    movieForUpdate.setValue(newData.releaseDate, forKey: "releaseDate")
                }
            }

            do {
                try context.save()
            } catch {
                print("failed to update data")
            }
        } catch {
            print("fail")
        }
    }
    
    func addNewMovie(_ newMovie: Movie) {
        let context = appDelegate!.persistentContainer.viewContext
        
        let userCoreData = UserCoreDataManager()
        let authorEmail = userCoreData.getUserEmail()
        
        let newID = getIdForNewMovie()
        
        let movieEntity = NSEntityDescription.entity(forEntityName: "MovieDataBase", in: context)!

        let movieDataBase = NSManagedObject(entity: movieEntity, insertInto: context)
        
        movieDataBase.setValue(newID, forKey: "id")
        movieDataBase.setValue(newMovie.poster, forKey: "poster")
        movieDataBase.setValue(newMovie.posterTitle, forKey: "posterTitle")
        movieDataBase.setValue(newMovie.movieGenre, forKey: "movieGenre")
        movieDataBase.setValue(authorEmail, forKey: "author")
        movieDataBase.setValue(newMovie.reviewMessage, forKey: "reviewMessage")
        movieDataBase.setValue(newMovie.budget, forKey: "budget")
        movieDataBase.setValue(newMovie.releaseDate, forKey: "releaseDate")

        do {
            try context.save()
        } catch {
            print("fail")
        }
    }
    
    func deleteMovie(_ movieId: Int) {
        let context = appDelegate!.persistentContainer.viewContext
        
        let request: NSFetchRequest<MovieDataBase> = MovieDataBase.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            var index = -1
            for movie in result {
                index += 1
                if movie.id == movieId {
                    context.delete(movie)
                }
            }
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    func getIdForNewMovie() -> Int {
        var currentMaxID: Int! = 0
        let moviesData = getAllMoviesFromLibrary()
        
        for movie in moviesData {
            if movie.id! > currentMaxID {
                currentMaxID = movie.id
            }
        }
        
        return currentMaxID + 1
    }

}
