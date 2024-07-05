//
//  LeaderBoardView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct LeaderBoardView: View {
    let users: [User] = [
        User(profilePicture: "memoji", name: "Ana", lastName: "Ioramashvili", birthdate: "2002-20-03", gender: "მდედრობითი", points: 150, level: "Senior", country: "საქართველო", email: "ana.io@gmail.com"),
        User(profilePicture: "memoji1", name: "Jeko", lastName: "Kharabadze", birthdate: "1995-15-07", gender: "მდედრობითი", points: 120, level: "Junior", country: "ქუთაისი", email: "ana.io@gmail.com"),
        User(profilePicture: "memoji", name: "Ana", lastName: "Ioramashvili", birthdate: "1998-10-12", gender: "მდედრობითი", points: 130, level: "Middle", country: "ბათუმი", email: "ana.io@gmail.com"),
        User(profilePicture: "memoji", name: "Ana", lastName: "Ioramashvili", birthdate: "2000-05-25", gender: "მდედრობითი", points: 110, level: "Senior", country: "ახალციხე", email: "ana.io@gmail.com"),
    ]
    
    var sortedUsers: [User] {
        users.sorted { $0.points > $1.points }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(Array(sortedUsers.enumerated()), id: \.element.id) { index, user in
                        UserCellView(user: user, rank: index + 1)
                    }
                }
                .padding()
            }
            .background(Color.myPurple)
            .navigationTitle("ლიდერბორდი")
            .toolbarBackground(.myPurple, for: .navigationBar, .tabBar)
        }
    }
}



#Preview {
    LeaderBoardView()
}
