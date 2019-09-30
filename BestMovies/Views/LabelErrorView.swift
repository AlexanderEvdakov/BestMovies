//
//  LabelErrorView.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/19/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class LabelErrorView: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.textColor = Color.errorColor
        self.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
    }
    
}
