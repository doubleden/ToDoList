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
    
    func fetchData(completion: @escaping(Result<[Task], NetworkError>) -> Void) {
        guard let url = URL(string: api) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let managedObjectContext = StorageManager.shared.context
                decoder.userInfo[CodingUserInfoKey.managedObjectContext] = managedObjectContext
                
                let apiInfo = try decoder.decode(ApiInfo.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(apiInfo.todos))
                }
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}

// MARK: - NetworkError Enum
extension NetworkManager {
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
}
