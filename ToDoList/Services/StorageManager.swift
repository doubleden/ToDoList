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
    
    func saveTask(with name: String, _ description: String, _ date: Date) -> Task {
        let taskCD = Task(context: context)
        taskCD.name = name
        taskCD.descrip = description
        taskCD.date = date
        saveContext()
        return taskCD
    }
    
    func toggleTaskIsDone(task: Task) {
        task.isDone.toggle()
        saveContext()
    }
    
    func edit(_ task: Task, withNewTask: Task) {
        task.name = withNewTask.name
        task.descrip = withNewTask.descrip
        task.date = withNewTask.date
        saveContext()
    }
    
    func delete(_ task: Task) {
        context.delete(task)
        saveContext()
    }
}

