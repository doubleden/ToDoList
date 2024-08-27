//
//  Task+CoreDataProperties.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var date: Date?
    @NSManaged public var descrip: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var name: String

}

extension Task : Identifiable {}
