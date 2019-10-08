//
//  ProfileModel.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/11/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import UIKit

class ProfileModel: NSObject {
    
    var isEditMode: Bool?
    
    override init() {
        self.isEditMode = false
    }
}

