//
//  StorageManager.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import CoreData

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {}
    
    func isFirstLaunch() -> Bool {
        !UserDefaults.standard.bool(forKey: "isFirstLaunch")
    }
    
    func appWasLaunched() {
        UserDefaults.standard.set(true, forKey: "isFirstLaunch")
    }
    
    func fetchData(_ completion: @escaping(Result<[Task], Error>) -> Void) {
        let request = Task.fetchRequest()
        
        do {
            let taskList = try context.fetch(request)
            DispatchQueue.main.async {
                completion(.success(taskList))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(task: Task) {
        let taskCD = Task(context: context)
        taskCD.name = task.name
        taskCD.descrip = task.descrip
        taskCD.date = task.date
        taskCD.isDone = task.isDone
        saveContext()
    }
}

