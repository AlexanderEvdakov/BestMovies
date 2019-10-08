//
//  Film.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/3/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var id: Int?
    var poster: String?
    var posterTitle: String?
    var movieGenre: String?
    var author: String?
    var reviewMessage: String?
    var budget: String?
    var releaseDate: String?
    
    init(id: Int, image: String, posterTitle: String, genre: String, author: String, reviewMessage: String, budget: String, releaseData: String) {
        self.id = id
        self.poster = image
        self.posterTitle = posterTitle
        self.movieGenre = genre
        self.author = author
        self.reviewMessage = reviewMessage
        self.budget = budget
        self.releaseDate = releaseData
    }
}
