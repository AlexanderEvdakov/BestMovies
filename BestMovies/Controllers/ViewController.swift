//
//  ViewController.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/13/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, Storyboarded {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createaAccountButton: UIButton!
    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailAddressFieldLabel: UILabel!
    @IBOutlet weak var passwordFieldLabel: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var logInScrollView: UIScrollView!
    
    var createAccountAction: (() -> Void)?
    
    var activityIndicator: UIActivityIndicatorView!
        
    var signInFormModel: SignInFormModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.title = "Sign In"
        
        emailAddressField.delegate = self
        passwordField.delegate = self
        
        signInButton.isEnabled = false
        signInButton.alpha = 0.5
        
        signInFormModel = SignInFormModel()
                
        emailAddressField.accessibilityIdentifier = AccessibilityIdentifiers.signInEmailFieldIdentifier
        passwordField.accessibilityIdentifier = AccessibilityIdentifiers.signInPasswordFieldIdentier
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func onSignInButtonTapped(_ sender: Any) {
        let loginManager = FirebaseAuthManager()
        guard let email = emailAddressField.text, let password = passwordField.text else { return }
        
        let activityIndicator = ActivityIndicatorHelper.setIndicatorOnButton(button: signInButton)
        
        loginManager.signIn(email: email, password: password) {success in
            ActivityIndicatorHelper.deleteIndicatorFromButton(self.signInButton, "Sign In", activityIndicator)
            
            var message: String = ""
            
            if (success) {
                message = Messages.signInSuccess
                FormsHelper.showSuccessAlert(message: message, alertTitle: "Sign in", viewController: self)
            } else {
                message = Messages.errorMessage
                self.passwordFieldLabel.text = message
            }
        }
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        KeyboardHelper.hanldeOverlayTextFieldsBehavior(notification: notification, view: view, scrollView: logInScrollView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { 
        ReturnButtonHelper.moveToTheNextTextField(textField: textField)
        
        return true
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        validate(textField)
        
        let formFieldsStatement: [Bool] = [signInFormModel.isEmailAddressFieldValid!, signInFormModel.isPasswordFieldValid!]
        
        if (formFieldsStatement.allSatisfy({ $0 == true })) {
            signInButton.isEnabled = true
            signInButton.alpha = 1
        }
    }
    
    func validate(_ textField: UITextField) {
        switch textField.accessibilityIdentifier {
        case AccessibilityIdentifiers.signInEmailFieldIdentifier:
            signInFormModel.isEmailAddressFieldValid = FormsHelper.handleFieldStatement(textField: textField, fieldLabel: emailAddressFieldLabel, validationType: ValidatorType.email)
        case AccessibilityIdentifiers.signInPasswordFieldIdentier:
            signInFormModel.isPasswordFieldValid = FormsHelper.handleFieldStatement(textField: textField, fieldLabel: passwordFieldLabel, validationType: ValidatorType.password)
        default:
            break
        }
    }
    
    
    @IBAction func onCreateAccountTapped(_ sender: Any) {
        createAccountAction?()
    }
    
}
