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
    
    var work: String {
        "Worker as some job"
    }
    
    var education: String {
        "Gradute degree"
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile"
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo"),
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "👟", text: "Running"),
            UserInterest(iconName: nil, emoji: "🏋️‍♂️", text: "Gym"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🥘", text: "Cooking"),
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/600/600", "https://picsum.photos/700/700", "https://picsum.photos/800/800"]
    }
    
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
