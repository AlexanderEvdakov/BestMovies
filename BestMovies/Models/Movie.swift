//
//  Film.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/3/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var poster: UIImage?
    var posterTitle: String?
    var movieGenre: String?
    var author: String?
    
    init(image: UIImage, posterTitle: String, genre: String, author: String) {
        self.poster = image
        self.posterTitle = posterTitle
        self.movieGenre = genre
        self.author = author
    }
}
