//
//  ProfileView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                if let user = viewModel.user {
                    VStack {
                        AsyncImage(url: URL(string: user.profilePictureUrl)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text("\(user.name) \(user.lastname)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(user.username)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 5)
                    )
                    
                    HStack(spacing: 20) {
                        StatView(title: "Level", value: viewModel.userLevel, color: .green)
                        StatView(title: "Points", value: "\(user.points)", color: .orange)
                    }
                    
                    VStack(spacing: 20) {
                        DetailRow(icon: "envelope", title: "Email", value: user.email)
                        DetailRow(icon: "calendar", title: "Birth Date", value: "20/03/2002")
                        DetailRow(icon: "person", title: "Gender", value: viewModel.gender)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    )
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                }
            }
            .padding()
        }
        .background(Color.myPurple.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.fetchUserData()
        }
    }
}


#Preview {
    ProfileView()
}

