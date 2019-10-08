//
//  ViewController.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/13/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var emailAddressField: UITextField! {
           didSet {
               emailAddressField.delegate = self
           }
       }
       
       @IBOutlet weak var passwordField: UITextField! {
           didSet {
               passwordField.delegate = self
           }
       }
    
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.isEnabled = false
            signInButton.alpha = 0.5
        }
    }
    
    @IBOutlet weak var emailAddressFieldLabel: UILabel!
    @IBOutlet weak var passwordFieldLabel: UILabel!
    
    @IBOutlet weak var createaAccountButton: UIButton!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var logInScrollView: UIScrollView!
    
    var createAccountAction: (() -> Void)?
    var navigateToMoviesTableView: (() -> Void)?
    
    var activityIndicator: UIActivityIndicatorView!
        
    var viewModel: SignInViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.title = "Sign In"
        
        viewModel = SignInViewModel()

        emailAddressField.accessibilityIdentifier = AccessibilityIdentifiers.signInEmailFieldIdentifier
        passwordField.accessibilityIdentifier = AccessibilityIdentifiers.signInPasswordFieldIdentier
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
}

// MARK: -Actions
extension ViewController {
    
    @IBAction func onSignInButtonTapped(_ sender: Any) {
        let activityIndicator = ActivityIndicatorHelper.setIndicatorOnButton(button: signInButton)
        
        viewModel?.signIn(button: signInButton, completionBlock: { (success) in
            ActivityIndicatorHelper.deleteIndicatorFromButton(self.signInButton, "Sign In", activityIndicator)
            
            var message: String = ""
            
            if success {
                message = Messages.signInSuccess
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.navigateToMoviesTableView?()
                }
                FormsHelper.showSuccessAlert(message: message, alertTitle: "Sign in", viewController: self, action: okAction)
            } else {
                message = Messages.errorMessage
                self.passwordFieldLabel.text = message
            }
        })
    }
    
    @IBAction func onCreateAccountTapped(_ sender: Any) {
        createAccountAction?()
    }
    
}

// MARK: -UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    @objc func adjustForKeyboard(notification: Notification) {
        KeyboardHelper.hanldeOverlayTextFieldsBehavior(notification: notification, view: view, scrollView: logInScrollView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ReturnButtonHelper.moveToTheNextTextField(textField: textField)
        
        return true
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.validateAndSaveData(textField, emailAddressFieldLabel, passwordFieldLabel)
        
        if (viewModel?.isFormValid())! {
            signInButton.isEnabled = true
            signInButton.alpha = 1
        } else {
            signInButton.isEnabled = false
            signInButton.alpha = 0.5
        }
    }
    
}
