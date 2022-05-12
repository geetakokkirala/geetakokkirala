//
//  Post.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import Foundation

public struct Post {
    public init(
        id: Int,
        userId: Int,
        title: String,
        body: String
    ) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }

    public let id: Int
    public let userId: Int
    public let title: String
    public let body: String
}

extension Post: Codable { }
extension Post: Equatable { }
