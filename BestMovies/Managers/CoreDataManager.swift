//
//  CoreDataManager.swift
//  BestMovies
//
//  Created by Alexander Evdakov on 10/1/19.
//  Copyright © 2019 Alexander Evdakov. All rights reserved.
//

import CoreData
import UIKit.UIApplication

class CoreDataManager {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func createNewUser(_ fullName: String, _ phoneNumber: String, _ emailAddress: String) {
        let context = appDelegate!.persistentContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            let user = result[0] as NSManagedObject
            user.setValue(fullName, forKey: "fullName")
            user.setValue(phoneNumber, forKey: "phoneNumber")
            user.setValue(emailAddress, forKey: "emailAddress")

            do {
                try context.save()
            } catch {
                print("fail")
            }
        } catch {
            print("fail")
        }
    }
    
    func getUserEmail() -> String {
        let context = appDelegate!.persistentContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let fail = "Failed to get data"
        
        do {
            let result = try context.fetch(request)

            for data in result as [NSManagedObject] {
                let emailAddress = data.value(forKey: "emailAddress") as! String

                return emailAddress
            }
        } catch {
            return fail
        }
        
        return fail
    }
    
    func deleteUser() {
        let context = appDelegate!.persistentContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            let objectToDelete = result[result.endIndex - 1] as NSManagedObject
            context.delete(objectToDelete)

            do {
                try context.save()
            } catch {
                print("fail")
            }
        } catch {
            print("fail")
        }
        
    }
    
}
