//
//  Constants.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 9/30/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

enum AccessibilityIdentifiers {
    static let signInEmailFieldIdentifier: String = "signInEmailFieldIdentifier"
    static let signInPasswordFieldIdentier: String = "signInPasswordFieldIdentifier"
    
    static let signUpFullNameIdentifier: String = "signUpFullNameIdentifier"
    static let signUpPhoneNumberIdentifier: String = "signUpPhoneNumberIdentifier"
    static let signUpEmailAddressIdentifier: String = "signUpEmailAddressIdentifier"
    static let signUpPasswordIdentifier: String = "signUpPasswordIdentifier"
}

enum Color {
    static let primaryColor = UIColor.init(red: 126, green: 234, blue: 223)
    static let secondaryColor = UIColor.lightGray
    

    static let successColor = UIColor.init(red: 77, green: 175, blue: 124)
    static let errorColor = UIColor.red
}

enum Messages {
    static let signInSuccess = "User was sucessfully logged in."
    static let signUpSuccess = "User was sucessfully created."
    
    static let errorMessage = "Something went wrong"
}
