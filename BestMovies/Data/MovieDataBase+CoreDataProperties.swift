//
//  MovieDataBase+CoreDataProperties.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/19/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//
//

import Foundation
import CoreData


extension MovieDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDataBase> {
        return NSFetchRequest<MovieDataBase>(entityName: "MovieDataBase")
    }

    @NSManaged public var author: String?
    @NSManaged public var budget: String?
    @NSManaged public var id: Int16
    @NSManaged public var movieGenre: String?
    @NSManaged public var poster: String?
    @NSManaged public var posterTitle: String?
    @NSManaged public var reviewMessage: String?
    @NSManaged public var releaseDate: String?

}
