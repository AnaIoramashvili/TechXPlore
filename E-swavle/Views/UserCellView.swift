//
//  UserCellView.swift
//  E-swavle
//
//  Created by Ana on 7/5/24.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    let rank: Int
    
    var body: some View {
        HStack(spacing: 25) {
            ZStack {
                Circle()
                    .fill(rankColor)
                    .frame(width: 80, height: 80)
                
                Image(user.profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
                Text("\(rank)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Circle().fill(Color.myPurple))
                    .offset(x: 30, y: -30)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.name) \(user.lastName)")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                InfoRow(icon: "calendar", text: user.birthdate)
                InfoRow(icon: "person", text: user.gender)
                InfoRow(icon: "star.fill", text: "\(user.points) points")
                InfoRow(icon: "chart.bar.fill", text: "Level \(user.level)")
                InfoRow(icon: "globe", text: user.country)
                InfoRow(icon: "envelope.fill", text: user.email)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    var rankColor: Color {
        switch rank {
        case 1:
            return .yellow
        case 2:
            return .gray
        case 3:
            return .orange
        default:
            return .blue.opacity(0.6)
        }
    }
}

struct InfoRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            Text(text)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
