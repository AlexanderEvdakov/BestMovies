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
    var isNewMovie: Bool!
    
    var imagePicker = UIImagePickerController()
    
    var viewModel: ProfileViewModel?
    
    @IBOutlet weak var datePickerLabel: UILabel! {
        didSet {
            datePickerLabel.text = movieData.releaseDate!
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var movieTitle: UITextField! {
        didSet {
            movieTitle.delegate = self
            movieTitle.layer.borderColor = Color.secondaryColor.cgColor
            movieTitle.text = movieData!.posterTitle
        }
    }
    
    @IBOutlet weak var movieGenre: UITextView! {
        didSet {
            movieGenre.delegate = self
            movieGenre.layer.borderWidth = 0.5
            movieGenre.layer.borderColor = Color.secondaryColor.cgColor
            movieGenre.layer.cornerRadius = 10.0
            movieGenre.text = movieData!.movieGenre
        }
    }
    
    @IBOutlet weak var budgetField: UITextField! {
        didSet {
            budgetField.delegate = self
            budgetField.layer.borderColor = Color.secondaryColor.cgColor
            budgetField.text = movieData!.budget
        }
    }
    
    @IBOutlet weak var authorReview: UITextView! {
        didSet {
            authorReview.delegate = self
            authorReview.layer.borderWidth = 0.5
            authorReview.layer.borderColor = Color.secondaryColor.cgColor
            authorReview.layer.cornerRadius = 10.0
            authorReview.text = movieData!.reviewMessage
        }
    }

    @IBOutlet weak var PosterImage: UIImageView! {
        didSet {
            PosterImage.image = UIImage(imageLiteralResourceName: movieData!.poster!)
        }
    }
    
    @IBOutlet weak var chooseImageButton: UIButton!
    
    @IBAction func onChooseImageClick(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ProfileViewModel(movieData: movieData!, movieTitle, movieGenre, budgetField, authorReview, navigationItem: navigationItem, chooseImageButton, isNewMovie: isNewMovie, datePicker: datePicker)
        
        navigationItem.title = "Profile"
        
        let rightBarButtonTitle = viewModel!.isEditMode! ? "Save" : "Edit"
        
        let deleteButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(onDeleteButtonClick))
        let editButton = UIBarButtonItem(title: rightBarButtonTitle, style: .plain, target: self, action: #selector(onEditButtonClick))
        
        navigationItem.rightBarButtonItems = [editButton, deleteButton]
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            authorReview.contentInset = .zero
        } else {
            authorReview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        authorReview.scrollIndicatorInsets = authorReview.contentInset

        let selectedRange = authorReview.selectedRange
        authorReview.scrollRangeToVisible(selectedRange)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short

        let dateString = dateFormatter.string(from: datePicker.date)
        datePickerLabel.text = dateString
        
        viewModel?.saveDate(dateString)
    }
        
}

// MARK: -UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    @objc func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel?.saveTextFieldValue(textField)
    }
    
}

// MARK: -UITextViewDelegate
extension ProfileViewController: UITextViewDelegate {
    
    @objc func textViewDidChangeSelection(_ textView: UITextView) {
        viewModel?.saveTextViewValue(textView)
    }
    
}

// MARK: -Actions
extension ProfileViewController {
    
    @objc func onEditButtonClick() {
        viewModel?.onEditButtonClick(navigationItem: navigationItem, budgetField: budgetField, authorReview: authorReview, movieGenre: movieGenre, movieTitle: movieTitle, datePicker: datePicker)
    }
    
    @objc func onDeleteButtonClick() {
        viewModel?.deleteMovieById(movieData!.id!, self, navigationController: navigationController!)
    }
    
}

//MARK: - UIImagePickerControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.PosterImage.image = editedImage
            
            viewModel?.saveImage(editedImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.isNavigationBarHidden = false
        self.dismiss(animated: true, completion: nil)
    }
}
