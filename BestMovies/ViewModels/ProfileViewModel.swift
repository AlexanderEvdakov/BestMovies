//
//  ProfileViewModel.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/11/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

final class ProfileViewModel {
    
    let movieCoreDataManager: MovieCoreDataManager = MovieCoreDataManager()
    var model: ProfileModel = ProfileModel()
    
    var updatedMovie: Movie?
    
    var isEditMode: Bool?
    var isNewMovie: Bool! = false
    var navigationItem: UINavigationItem!
    
    init(movieData: Movie, _ movieTitle: UITextField, _ movieGenre: UITextView, _ budgetField: UITextField, _ authorReview: UITextView, navigationItem: UINavigationItem, _ chooseImageButton: UIButton, isNewMovie: Bool, datePicker: UIDatePicker) {
        self.navigationItem = navigationItem
        
        if isNewMovie {
            isEditMode = true
            self.isNewMovie = isNewMovie
        } else {
            isEditMode = model.isEditMode!
            chooseImageButton.layer.isHidden = true
        }
        
        updatedMovie = Movie(id: movieData.id!, image: movieData.poster!, posterTitle: movieData.posterTitle!, genre: movieData.movieGenre!, author: movieData.author!, reviewMessage: movieData.reviewMessage!, budget: movieData.budget!, releaseData: movieData.releaseDate!)
        
        handleEditMode(movieTitle, movieGenre, budgetField, authorReview, datePicker)
    }
    
    func onEditButtonClick(navigationItem: UINavigationItem, budgetField: UITextField, authorReview: UITextView, movieGenre: UITextView, movieTitle: UITextField, datePicker: UIDatePicker) {
        isEditMode?.toggle()
          
        
        if isNewMovie && !isEditMode! {
            movieCoreDataManager.addNewMovie(updatedMovie!)
        } else if !isEditMode! {
            movieCoreDataManager.updateMovieData(newData: updatedMovie!)
        }
        
        handleEditMode(movieTitle, movieGenre, budgetField, authorReview, datePicker)
    }
    
    func deleteMovieById(_ id: Int, _ viewController: UIViewController, navigationController: UINavigationController) {
        let okAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.movieCoreDataManager.deleteMovie(id)
            navigationController.popViewController(animated: true)
        }
        let alert = UIAlertController(title: "Delete movie", message: "Are you sure you want to delete the movie?", preferredStyle: .alert)
        
        alert.addAction(okAction)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func saveTextFieldValue(_ textField: UITextField) {
        var newBudget: String?
        var newMovieTitle: String?
        
        switch textField.accessibilityLabel {
        case "budget":
            newBudget = textField.text
            updatedMovie?.budget = newBudget
        case "movieTitle":
            newMovieTitle = textField.text
            updatedMovie?.posterTitle = newMovieTitle
        default:
            break
        }
    }
    
    func saveTextViewValue(_ textView: UITextView) {
        var newReviewMessage: String?
        var newMovieGenre: String?
        
        switch textView.accessibilityLabel {
        case "reviewMessage":
            newReviewMessage = textView.text
            updatedMovie?.reviewMessage = newReviewMessage
        case "movieGenre":
            newMovieGenre = textView.text
            updatedMovie?.movieGenre = newMovieGenre
        default:
            break
        }
    }
    
    func saveImage(_ newPosterImage: UIImage) {
        
    }
    
    func saveDate(_ date: String) {
        updatedMovie?.releaseDate = date
    }
    
    func handleEditMode(_ movieTitle: UITextField, _ movieGenre: UITextView, _ budgetField: UITextField, _ authorReview: UITextView, _ datePicker: UIDatePicker) {
        navigationItem.rightBarButtonItem?.title = isEditMode! ? "Save" : "Edit"
        
        switch isEditMode! {
        case true:
            movieTitle.layer.borderColor = Color.successColor.cgColor
            movieGenre.layer.borderColor = Color.successColor.cgColor
            budgetField.layer.borderColor = Color.successColor.cgColor
            authorReview.layer.borderColor = Color.successColor.cgColor
        default:
            movieTitle.layer.borderColor = Color.secondaryColor.cgColor
            movieGenre.layer.borderColor = Color.secondaryColor.cgColor
            budgetField.layer.borderColor = Color.secondaryColor.cgColor
            authorReview.layer.borderColor = Color.secondaryColor.cgColor
        }
        
        movieTitle.isEnabled = isEditMode!
        movieGenre.isEditable = isEditMode!
        budgetField.isEnabled = isEditMode!
        authorReview.isEditable = isEditMode!
        datePicker.isEnabled = isEditMode!
    }
 
}
