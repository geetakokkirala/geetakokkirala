//
//  NetworkManager.swift
//  tabularview
//
//  Created by Admin on 08/02/2022.
//

import Foundation


class NetworkManager {
    
    func postStory(_ story: Story, to url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        if let data = try? JSONEncoder().encode(story) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = data
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
               
            }
            .resume()
        }
        
        
    }
    
    func getModel<T: Decodable>(_ model: T.Type, from url: String, completion: @escaping (Result<T, NetworkError>) -> Void ) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(model, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
    
    func getStories(from url: String, completion: @escaping (Result<[Story], NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(RedditResponse.self, from: data)
                    
                    
                    let arrayStories = response.data.children.map { $0.data }
                    
//                    var newResponse = [Story]()
//                    for item in response.data.children {
//                        newResponse.append(item.data)
//                    }
//                    completion(.success(newResponse))
                    
                    
                    completion(.success(arrayStories))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
    
    func getPosts(from url: String, completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    
                    
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                    
                } catch let error {
                    completion(.failure(.other(error)))
                }
                return
            }
            
            if let error = error {
                completion(Result.failure(NetworkError.other(error)))
            }
            
        }
        .resume()
        
    }
    
}
