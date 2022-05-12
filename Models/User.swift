//
//  User.swift
//  NutmegTest
//
//  Created by Nutmeg on 04/05/2022.
//

import Foundation

public struct User {
    public init(
        id: Int,
        username: String
    ) {
        self.id = id
        self.username = username
    }

    public let id: Int?
    public let username: String?
}

extension User: Codable { }
extension User: Equatable { }
