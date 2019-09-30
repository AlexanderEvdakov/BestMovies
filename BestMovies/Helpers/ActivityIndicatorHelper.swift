//
//  ActivityIndicatorHelper.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/24/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class ActivityIndicatorHelper {
    
    static func setIndicatorOnButton(button: UIButton) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        let buttonHeight = button.bounds.size.height
        let buttonWidth = button.bounds.size.width
        activityIndicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        button.addSubview(activityIndicator)
        
        button.alpha = 0.5
        button.setTitle(nil, for: .normal)
        button.isEnabled = false
        
        activityIndicator.startAnimating()
        
        return activityIndicator
    }
    
    static func deleteIndicatorFromButton(_ button: UIButton, _ title: String, _ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        button.isEnabled = true
        button.alpha = 1
        button.setTitle(title, for: .normal)
    }
    
}
