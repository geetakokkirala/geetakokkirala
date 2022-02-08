//
//  PostService.swift
//  tabularview
//
//  Created by Admin on 08/02/2022.
//

import Foundation


class NetworkManager2<Model: Decodable> {
    func getModel(from url: String, completion: @escaping (Result<Model, NetworkError>) -> Void ) {
        
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
                    let response = try JSONDecoder().decode(Model.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
}

class PostsService: NetworkManager2<[Post]> { //} NetworkProtocol {
    
//    typealias Model = [Post]
    
    
}
