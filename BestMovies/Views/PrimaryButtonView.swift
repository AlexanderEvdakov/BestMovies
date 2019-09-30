//
//  PrimaryButtonView.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/20/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class PrimaryButtonView: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPrimaryButtonView()
    }

    func setupPrimaryButtonView() {
        self.layer.cornerRadius = 20
        self.layer.backgroundColor = Color.primaryColor.cgColor
    }
    
    func setDisabledStyle() {
        self.isEnabled = true
        self.alpha = 1
    }
    
}
