//
//  Coordinator.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 9/30/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import Foundation
import UIKit.UINavigationController

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
