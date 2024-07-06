//
//  RecommendedCoursesView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct RecommendedCoursesView: View {
    @StateObject private var viewModel = CourseViewModel()
    @State private var searchText = ""
    @State private var showingFilterOptions = false
    @State private var selectedCategory: Int?
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var filteredCourses: [Course] {
        viewModel.courses.filter { course in
            let matchesSearch = searchText.isEmpty || course.title.lowercased().contains(searchText.lowercased())
            let matchesCategory = selectedCategory == nil || course.category == selectedCategory
            return matchesSearch && matchesCategory
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(searchText: $searchText, onFilterTap: {
                showingFilterOptions = true
            })
            .padding(.top)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.courses.isEmpty {
                ProgressView("Loading...")
                    .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredCourses) { course in
                            CourseCard(course: course)
                        }
                    }
                    .padding(16)
                }
            }
        }
        .background(.myPurple)
        .sheet(isPresented: $showingFilterOptions) {
            FilterView(selectedCategory: $selectedCategory)
        }
        .toolbarBackground(.myPurple, for: .navigationBar, .tabBar)
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

#Preview {
    RecommendedCoursesView()
}
