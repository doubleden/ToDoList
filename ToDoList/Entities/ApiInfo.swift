//
//  Todos.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

struct ApiInfo: Decodable {
    let todos: [Task]
    let total: Int
    let skip: Int
    let limit: Int
}
