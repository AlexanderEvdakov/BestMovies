//
//  ProfileViewController.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/7/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MoviesCoordinator?
    var movieData: Movie!
    
    @IBOutlet weak var PosterImage: UIImageView! {
        didSet {
            PosterImage.image = movieData!.poster
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Profile"
    }
    
}
