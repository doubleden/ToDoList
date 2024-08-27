//
//  Task+CoreDataClass.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//
//

import CoreData

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

@objc(Task)
public class Task: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case todo, completed
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .todo)
        self.isDone = try container.decode(Bool.self, forKey: .completed)
    }
}
