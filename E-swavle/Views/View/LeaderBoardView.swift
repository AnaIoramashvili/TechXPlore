//
//  LeaderBoardView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct LeaderBoardView: View {
    @StateObject private var viewModel = LeaderBoardViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(Array(viewModel.users.enumerated()), id: \.element.id) { index, user in
                        UserCellView(user: user, rank: index + 1)
                    }
                }
                .padding()
            }
            .background(Color.myPurple)
            .navigationTitle("ლიდერბორდი")
            .toolbarBackground(.myPurple, for: .navigationBar, .tabBar)
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}


#Preview {
    LeaderBoardView()
}
