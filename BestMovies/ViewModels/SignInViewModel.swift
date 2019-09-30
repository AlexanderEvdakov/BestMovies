//
//  SignInViewModel.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 9/30/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit.UITextField

final class SignInViewModel {
    var signInFormModel: SignInFormModel = SignInFormModel()
    
    func validateAndSaveData(_ textField: UITextField, _ emailAddressFieldLabel: UILabel, _ passwordFieldLabel: UILabel) {
        switch textField.accessibilityIdentifier {
        case AccessibilityIdentifiers.signInEmailFieldIdentifier:
            signInFormModel.isEmailAddressFieldValid = FormsHelper.handleFieldStatement(textField: textField, fieldLabel: emailAddressFieldLabel, validationType: ValidatorType.email)
            signInFormModel.emailAddress = textField.text
        case AccessibilityIdentifiers.signInPasswordFieldIdentier:
            signInFormModel.isPasswordFieldValid = FormsHelper.handleFieldStatement(textField: textField, fieldLabel: passwordFieldLabel, validationType: ValidatorType.password)
            signInFormModel.password = textField.text
        default:
            break
        }
    }
    
    func isFormValid() -> Bool {
        return [signInFormModel.isEmailAddressFieldValid!, signInFormModel.isPasswordFieldValid!].allSatisfy({ $0 == true })
    }
    
    func signIn(button: UIButton, completionBlock: @escaping (_ success: Bool) -> Void) {
        let loginManager = FirebaseAuthManager()
        
        if let email = signInFormModel.emailAddress, let password = signInFormModel.password {
            loginManager.signIn(email: email, password: password) {success in
                completionBlock(success)
            }
        }
    }
}
