//
//  ImageViewCell.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/2/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterViewCell: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieNoteAuthor: UILabel!
    
    func setMovies(moviePoster: Movie) {
        moviePosterViewCell.translatesAutoresizingMaskIntoConstraints = true
        
        moviePosterViewCell.image = UIImage(imageLiteralResourceName: moviePoster.poster!)
        movieTitle.text = moviePoster.posterTitle
        movieGenre.text = moviePoster.movieGenre
        movieNoteAuthor.text = moviePoster.author
    }
    
}
