//
//  SignUpView.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/27/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit.UIView

class SignUpView: UIView, UITextFieldDelegate {
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
    @IBOutlet weak var emailAddressErrorField: LabelErrorView!
    @IBOutlet weak var passwordErrorLabel: LabelErrorView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var signUpScrollView: UIScrollView!
    
    var activityIndicator: UIActivityIndicatorView!
}
