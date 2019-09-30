//
//  SignUpViewController.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/20/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fullNameField: TextInputFieldView! {
        didSet {
            fullNameField.delegate = self
        }
    }
    
    @IBOutlet weak var phoneNumberField: TextInputFieldView! {
        didSet {
            phoneNumberField.delegate = self
        }
    }
    
    @IBOutlet weak var emailAddressField: TextInputFieldView! {
        didSet {
            emailAddressField.delegate = self
        }
    }
    
    @IBOutlet weak var passwordField: TextInputFieldView! {
        didSet {
            passwordField.delegate = self
        }
    }
    
    @IBOutlet weak var signUpButton: PrimaryButtonView! {
        didSet {
            signUpButton.isEnabled = false
            signUpButton.alpha = 0.5
        }
    }
    
    @IBOutlet weak var fullNameErrorLabel: LabelErrorView!
    @IBOutlet weak var phoneNumberErrorLabel: LabelErrorView!
    @IBOutlet weak var emailAddressErrorLabel: LabelErrorView!
    @IBOutlet weak var passwordErrorLabel: LabelErrorView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var signUpScrollView: UIScrollView!
    
    var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: SignUpViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign Up"
        
        viewModel = SignUpViewModel()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
}

// MARK: -Actions
extension SignUpViewController {
    @IBAction func createAccount(_ sender: Any) {
        let activityIndicator = ActivityIndicatorHelper.setIndicatorOnButton(button: signUpButton)
        
        viewModel?.createAccount(button: signUpButton, activityIndicator: activityIndicator) { result in
            var message: String = ""
            
            if (result) {
                message = Messages.signUpSuccess
                FormsHelper.showSuccessAlert(message: message, alertTitle: "Create Account", viewController: self)
            } else {
                message = Messages.errorMessage
                self.passwordErrorLabel.text = message
            }
        }
    }
}

// MARK: -UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    @objc func adjustForKeyboard(notification: Notification) {
        KeyboardHelper.hanldeOverlayTextFieldsBehavior(notification: notification, view: view, scrollView: signUpScrollView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ReturnButtonHelper.moveToTheNextTextField(textField: textField)
        
        return true
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.validateAndSaveData(textField, fullNameErrorLabel, phoneNumberErrorLabel, emailAddressErrorLabel, passwordErrorLabel)
        
        if (viewModel?.isFormValid())! {
            signUpButton.isEnabled = true
            signUpButton.alpha = 1
        } else {
            signUpButton.isEnabled = false
            signUpButton.alpha = 0.5
        }
    }
}
