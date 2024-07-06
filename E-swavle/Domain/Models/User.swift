//
//  User.swift
//  E-swavle
//
//  Created by Ana on 7/5/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let lastname: String
    let birthDate: String
    let gender: Bool
    let profilePictureUrl: String
    let points: Int
    let country: String
    let level: Int
    let username: String
    let email: String
}
