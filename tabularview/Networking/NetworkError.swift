//
//  NetworkError.swift
//  tabularview
//
//  Created by Admin on 08/02/2022.
//

import Foundation


enum NetworkError: Error, LocalizedError {
    case badURL
    case other(Error)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad url"
        case .other(let error):
            return error.localizedDescription
        }
    }
}
