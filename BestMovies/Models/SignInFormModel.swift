//
//  SignInFormModel.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/25/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class SignInFormModel: NSObject {
    
    var emailAddress: String?
    var password: String?
    
    var isEmailAddressFieldValid: Bool?
    var isPasswordFieldValid: Bool?
    
    override init() {
        self.isEmailAddressFieldValid = false
        self.isPasswordFieldValid = false
    }
    
}
