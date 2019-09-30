//
//  File.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 9/30/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instatiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instatiate() -> Self {
        let id = String(describing: self)
        let storyboad = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboad.instantiateViewController(withIdentifier: id) as! Self
    }
}

