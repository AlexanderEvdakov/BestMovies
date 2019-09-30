//
//  FormsValidationObserver.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/24/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation

class FormFieldsValidationState: NSObject {
    @objc dynamic var isInEmailAddressFieldValid = false
    @objc dynamic var isInPasswordFieldValid = false
    
    @objc dynamic var isUpFullNameFieldValid = false
    @objc dynamic var isUpPhoneNumberFieldValid = false
    @objc dynamic var isUpEmailAddressFieldValid = false
    @objc dynamic var isUpPasswordFieldValid = false
}

protocol FormFieldsValidationStateDelegate {
    func fieldValueDidChange(fieldErorrState: Bool)
}

class FormFieldsValidationStateObserver: NSObject {
    @objc var formFieldsErrorState: FormFieldsValidationState
    var  observation: NSKeyValueObservation?
    var delegate: FormFieldsValidationStateDelegate?
    
    init(object: FormFieldsValidationState) {
        self.formFieldsErrorState = object
        super.init()
        
        observation = observe(\.formFieldsErrorState.isInEmailAddressFieldValid, options: [.old, .new], changeHandler: {
            (object, change) in
            print(change.newValue ?? false)
            if let newDelegate = self.delegate {
                newDelegate.fieldValueDidChange(fieldErorrState: change.newValue ?? false)
            }
        })
    }
}
