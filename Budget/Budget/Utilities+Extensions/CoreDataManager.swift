//
//  CoreDataManager.swift
//  Budget
//
//  Created by Charles on 26/03/25.
//

import CoreData

class CoreDataManager {
    
    static var shared = CoreDataManager()
    
    private var persistanceContainer:NSPersistentContainer
    
    private init() {
        persistanceContainer = NSPersistentContainer(name: "Budget")
        persistanceContainer.loadPersistentStores { description,error  in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    var viewContext:NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
    
    
}
