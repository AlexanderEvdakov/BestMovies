//
//  ProfileFieldView.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/11/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit.UITextField

class ProfileFieldView: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.white
    }
    
}
