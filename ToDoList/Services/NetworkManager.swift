//
//  NetworkManager.swift
//  ToDoList
//
//  Created by Denis Denisov on 27/8/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let api = "https://dummyjson.com/todos"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ courses: [Task]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tasks = try decoder.decode([Task].self, from: data)
                DispatchQueue.main.async {
                    completion(tasks)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}
