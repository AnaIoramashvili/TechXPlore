//
//  Course.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import Foundation

struct Course: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let date: String
    let author: String
    let thumbnailURL: String
    let content: String
    let sourceURL: String
    let type: Int
    let category: Int
    let organizationId: Int
    let comments: [Comment]
    let organization: Organization
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, date, author, thumbnailURL, content, sourceURL, type, category, organizationId, comments, organization
    }
}

struct Comment: Identifiable, Codable {
    let id: Int
    let content: String
    let datePosted: String
    let userId: Int
    let user: User
}

struct Organization: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let websiteURL: String
    let contactEmail: String
    let contactPhoneNumber: String
    let headquartersAddress: String
    let industry: String
    let employeeCount: Int
    let logoURL: String
}
