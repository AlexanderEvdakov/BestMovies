//
//  MoviesListViewController.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/2/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, Storyboarded {
    
    weak var coordinator: SignUpCoordinator?
    
    var navigateToProfile: ((_ movie: Movie) -> Void)?
    var selectedMovie: Movie?
 
    var viewModel: MoviesTableViewModel?
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MoviesTableViewModel()
        movies = viewModel!.getMoviesList()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = .gray
        
        navigationItem.title = "Movies"
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(signOut))
    }
    
}

// MARK: -Actions

extension MoviesTableViewController {
    
    @objc func signOut() {
        print("sign out")
    }
    
}

// MARK: -TablView
extension MoviesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell") as! MovieViewCell
        
        cell.setMovies(moviePoster: movie)
        
        let isAuthorMovieCard = viewModel?.isAuthorMovieCard(movieAuthorEmail: cell.movieNoteAuthor.text!)
        
        if isAuthorMovieCard! {
            cell.backgroundColor = .lightGray
        } else {
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.alpha = 0.7
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.alpha = 1
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedMovie = movies[indexPath.row]
        navigateToProfile?(movies[indexPath.row])
        
        return indexPath
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = 122
    }
    
}
