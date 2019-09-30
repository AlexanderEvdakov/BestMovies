//
//  SupportButtonView.swift
//  BestMoovies
//
//  Created by Alexander Evdakov on 9/20/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class CreateAccountButtonView: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSupportButtonView()
    }
    
    func setupSupportButtonView() {
        let buttonUnderlineAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: "or Create Account",
                                                        attributes: buttonUnderlineAttributes)
        
        self.setAttributedTitle(attributeString, for: .normal)
    }

}
