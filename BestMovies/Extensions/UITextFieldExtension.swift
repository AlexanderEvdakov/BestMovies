//
//  UITextField.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/18/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
