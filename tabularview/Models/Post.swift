//
//  Post.swift
//  tabularview
//
//  Created by Admin on 08/02/2022.
//

import Foundation

struct Post: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
