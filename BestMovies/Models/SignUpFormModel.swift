//
//  SignUpFormModel.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/25/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class SignUpFormModel: NSObject {
    
    var fullName: String?
    var phoneNumber: String?
    var emailAddress: String?
    var password: String?
    
    var isFullNameFieldValid: Bool?
    var isPhoneNumberFieldValid: Bool?
    var isEmailAddressFieldValid: Bool?
    var isPasswordFieldValid: Bool?
    
    override init() {
        self.isFullNameFieldValid = false
        self.isPhoneNumberFieldValid = false
        self.isEmailAddressFieldValid = false
        self.isPasswordFieldValid = false
    }
    
}
