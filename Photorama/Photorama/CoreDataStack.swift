//
//  CoreDataStack.swift
//  Photorama
//
//  Created by Marcin Sporysz on 18/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    let managedObjectModelName: String
    
    private lazy var manageObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(self.managedObjectModelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    private var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        var coor = NSPersistentStoreCoordinator(managedObjectModel: self.manageObjectModel)
        let pathComponent = "\(self.managedObjectModelName).sqlite"
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(pathComponent)
        
        let store = try! coor.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        
        return coor
    }()
    
    lazy var mainQueueContext: NSManagedObjectContext = {
        let moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        moc.persistentStoreCoordinator = self.persistentStoreCoordinator
        moc.name = "Main Queue Context (UI Context)"
        
        return moc
    }()
    
    
    
    //MARK: - Methods
    required init(modelName: String) {
        managedObjectModelName = modelName
        
    }
    
    func saveChanges() throws {
        var error: ErrorType?
        mainQueueContext.performBlockAndWait() {
            if self.mainQueueContext.hasChanges {
                do {
                    try self.mainQueueContext.save()
                }
                catch let saveError {
                    error = saveError
                }
            }
        }
        if let error = error {
            throw error
        }
    }
}