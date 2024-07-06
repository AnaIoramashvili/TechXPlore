//
//  TabBarView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case home = 0
    case leaderboard
    case courses
    case aboutUs
    
    var title: String {
        switch self {
        case .home:
            return "მთავარი"
        case .leaderboard:
            return "ლიდერ ბორდი"
        case .courses:
            return "კურსები"
        case .aboutUs:
            return "პროფილ"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .leaderboard:
            return "list.star"
        case .courses:
            return "text.book.closed"
        case .aboutUs:
            return "person.crop.circle"
        }
    }
}

struct TabBarView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                LeaderBoardView()
                    .tag(1)
                
                RecommendedCoursesView()
                    .tag(2)
                
                ProfileView()
                    .tag(3)
            }
            
            ZStack {
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(Color.black.opacity(0.8))
            .cornerRadius(35)
            .padding(.horizontal, 26)
        }
        .accentColor(.black)
        .navigationBarBackButtonHidden(true)
    }
}

extension TabBarView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
        }
        .frame(minWidth: 60, idealWidth: isActive ? 150 : 60)
        .padding(isActive ? 10 : 0) 
        .background(isActive ? Color.purple.opacity(0.6) : .clear)
        .cornerRadius(30)
    }
    
}

#Preview {
    TabBarView()
}
