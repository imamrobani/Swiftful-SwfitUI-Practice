//
//  User.swift
//  SwiftfulSwiftUIPractice
//
//  Created by Imam Robani on 22/04/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    static var mock: User {
        User(
            id: 111,
            firstName: "Imam",
            lastName: "Robani",
            age: 28,
            email: "imamrob@gmail.com",
            phone: "+6281322437508",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}
