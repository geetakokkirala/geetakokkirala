//
//  ViewModel.swift
//  work1
//
//  Created by Admin on 07/02/2022.
//

import Foundation
import Combine
 
class ViewModel {
    
    @Published var data = Data()
    
    func downloadImage(width: Int, height: Int) {
        let url = "https://picsum.photo/\(width)/\(height)"
        
        guard let urlRequest = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: urlRequest) {[weak self] data, response, error in
            if let data = data {
                self?.data = data
            }
        }
        .resume()
    }
    
}
