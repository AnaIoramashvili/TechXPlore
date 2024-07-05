//
//  User.swift
//  E-swavle
//
//  Created by Ana on 7/5/24.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let profilePicture: String 
    let name: String
    let lastName: String
    let birthdate: String
    let gender: String
    let points: Int
    let level: String
    let country: String
    let email: String
}
