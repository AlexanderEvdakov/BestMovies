//
//  FormsHelper.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/19/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class FormsHelper {
    
    static func handleFieldStatement(textField: UITextField, fieldLabel: UILabel, validationType: ValidatorType) -> Bool {
        do {
            let _ = try textField.validatedText(validationType: validationType)
            fieldLabel.text = nil
            textField.layer.borderColor = Color.successColor.cgColor
            
            return true
        } catch(let error) {
            textField.layer.borderColor = Color.errorColor.cgColor
            fieldLabel.text = (error as! ValidationError).message
            
            return false
        }
    }
    
    static func showSuccessAlert(message: String, alertTitle: String, viewController: UIViewController) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
