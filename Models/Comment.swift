//
//  Comments.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import Foundation

public struct Comment {
    public init(
        id: Int,
        postId: Int,
        name: String,
        email: String,
        body: String
    ) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }

    public let id: Int
    public let postId: Int
    public let name: String
    public let email: String
    public let body: String
}


extension Comment: Equatable { }
extension Comment: Codable { }
