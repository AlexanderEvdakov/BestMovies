//
//  User+CoreDataProperties.swift
//  
//
//  Created by Alexander Evdakov on 9/30/19.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var emailAddress: String?
    @NSManaged public var fullName: String?
    
}
