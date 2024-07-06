//
//  HomeView.swift
//  E-swavle
//
//  Created by Ana on 7/5/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showRecommendedCourses = false
    @State private var showProfile = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("გამარჯობა, ანა!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("დაიწყე შენი დღე სწავლით")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        Spacer()
                        Button(action: {
                            showProfile = true
                        }) {
                            Image("memoji")
                                .resizable()
                                .frame(width: 60, height: 100)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top)
                    
                    LearningProgressView()
                    
                    WhatToLearnView(showRecommendedCourses: $showRecommendedCourses)
                    
                    LearningPlanView()
                    
                    MeetupView()
                    
                    TokenView(imageName: "token_icon", tokenCount: 100)

                    BusinessPartners()
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color.myPurple.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showRecommendedCourses) {
            RecommendedCoursesView()
        }
        .sheet(isPresented: $showProfile) {
            ProfileView()
        }
        .toolbarBackground(.myPurple, for: .navigationBar, .tabBar)
    }
}



struct LearningProgressView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("დღის სამეცადინო პროგრესი")
                    .font(.subheadline)
            }
            Text("46 წუთი")
                .font(.title2)
                .fontWeight(.bold)
            + Text(" / 60 წუთი")
                .font(.subheadline)
            ProgressView(value: 46, total: 60)
                .accentColor(.orange)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct WhatToLearnView: View {
    @Binding var showRecommendedCourses: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("რისი სწავლა გინდა დღეს?")
                    .font(.headline)
                    .foregroundColor(.black)
                Button("დავიწყოთ") {
                    showRecommendedCourses = true
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            Spacer()
            Image("learn_illustration")
                .resizable()
                .frame(width: 80, height: 80)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
    }
}

struct LearningPlanView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("სწავლის გეგმა")
                .font(.headline)
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
                Text("iOS")
                Spacer()
                Text("40/48")
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
                Text("Product Design")
                Spacer()
                Text("6/24")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct MeetupView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("შეხვედრა მენტორებთან")
                    .font(.headline)
                Text("გავუზიაროთ ერთმანეთს ჩვენი ცოდნა")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image("meetup_illustration")
                .resizable()
                .frame(width: 60, height: 60)
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}


struct TokenView: View {
    let imageName: String
    let tokenCount: Int
    
    var body: some View {
        HStack {
            Image("coin")
                .resizable()
                .frame(width: 60, height: 60)
            Text("ტოკენების რაოდენობა:")
                .font(.headline)
            Spacer()
            Text("\(tokenCount)")
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
    
}

struct BusinessPartners: View {
    
    var body: some View {
        VStack {
            Text("ბიზნეს პარტნიორი")
                .font(.headline)
            Image("tbc")
                .resizable()
                .frame(width: 160, height: 50)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 0)
    }
    
}


#Preview {
    HomeView()
}
