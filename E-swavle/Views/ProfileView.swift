//
//  ProfileView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct ProfileView: View {
    // Sample user data - replace with actual user data source
    let user = Users(
        profilePicture: "memoji",
        firstName: "Ana",
        lastName: "Ioramashvili",
        dateOfBirth: Date(timeIntervalSince1970: 786297600), // Example date
        gender: "მდედრობითი",
        points: 1250,
        level: "Senior",
        username: "ana222",
        email: "ana@gmail.com"
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Picture
                Image(user.profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                
                // Name
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Level and Points
                HStack {
                    LevelPointsView(title: "დონე", value: user.level)
                    Divider().frame(height: 30)
                    LevelPointsView(title: "ქულა", value: "\(user.points)")
                }
                .padding()
                .background(Color.white.opacity(0.4))
                .cornerRadius(10)
                
                // User Details
                VStack(spacing: 20) {
                    DetailRow(title: "მომხმარებლის სახელი", value: user.username)
                    DetailRow(title: "E-მეილი", value: user.email)
                    DetailRow(title: "დაბადების თარიღი", value: formatDate(user.dateOfBirth))
                    DetailRow(title: "სქესი", value: user.gender)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }
            .padding()
        }
        .background(Color.myPurple)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct Users {
    let profilePicture: String
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    let gender: String
    let points: Int
    let level: String
    let username: String
    let email: String
}

struct LevelPointsView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
}



#Preview {
    ProfileView()
}
