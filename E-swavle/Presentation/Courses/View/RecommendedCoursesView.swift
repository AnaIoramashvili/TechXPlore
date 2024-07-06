//
//  RecommendedCoursesView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

//import SwiftUI
//
//struct Course: Identifiable {
//    let id = UUID()
//    let title: String
//    let imageName: String
//    let rating: Double
//    let category: CourseCategory
//}
//
//enum CourseCategory: String, CaseIterable {
//    case education = "განათლება"
//    case entertainment = "გართობა"
//    case news = "ახალი ამბები"
//    case others = "სხვა"
//}
//
//struct CourseCard: View {
//    let course: Course
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            Image(course.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(height: 120)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//            
//            Text(course.title)
//                .font(.system(size: 14, weight: .semibold))
//                .lineLimit(1)
//            
//                .font(.system(size: 12))
//                .foregroundColor(.secondary)
//            HStack {
//                Image(systemName: "star.fill")
//                    .foregroundColor(.yellow)
//                    .font(.system(size: 12))
//                Text(String(format: "%.1f", course.rating))
//                    .font(.system(size: 12))
//            }
//        }
//        .frame(width: 160, height: 180)
//        .padding(8)
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
//    }
//}
//
//struct RecommendedCoursesView: View {
//    @State private var searchText = ""
//    @State private var showingFilterOptions = false
//    @State private var selectedCategory: CourseCategory?
//    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    
//    let courses: [Course] = [
//        Course(title: "Career Development", imageName: "career1", rating: 5.0, category: .education),
//        Course(title: "Basic Dev's", imageName: "dev1", rating: 5.0, category: .education),
//        Course(title: "Entertainment Basics", imageName: "career1", rating: 5.0, category: .entertainment),
//        Course(title: "News Writing", imageName: "dev1", rating: 5.0, category: .news),
//        Course(title: "Misc Skills", imageName: "career1", rating: 5.0, category: .others),
//        Course(title: "Tech Trends", imageName: "dev1", rating: 5.0, category: .news),
//        Course(title: "Tech Trends", imageName: "dev1", rating: 5.0, category: .news),
//        Course(title: "Tech Trends", imageName: "dev1", rating: 5.0, category: .news)
//    ]
//    
//    var filteredCourses: [Course] {
//        courses.filter { course in
//            let matchesSearch = searchText.isEmpty || course.title.lowercased().contains(searchText.lowercased())
//            let matchesCategory = selectedCategory == nil || course.category == selectedCategory
//            return matchesSearch && matchesCategory
//        }
//    }
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            SearchBar(searchText: $searchText, onFilterTap: {
//                showingFilterOptions = true
//            })
//            .padding(.top)
//            
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 16) {
//                    ForEach(filteredCourses) { course in
//                        CourseCard(course: course)
//                    }
//                }
//                .padding(16)
//            }
//        }
//        .background(.myPurple)
//        .sheet(isPresented: $showingFilterOptions) {
//            FilterView(selectedCategory: $selectedCategory)
//        }
//        .toolbarBackground(.myPurple, for: .navigationBar, .tabBar)
//
//    }
//    
//}
//
//struct SearchBar: View {
//    @Binding var searchText: String
//    var onFilterTap: () -> Void
//    
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .foregroundColor(.gray)
//            TextField("მოძებნე კურსები", text: $searchText)
//            Spacer()
//            Button(action: onFilterTap) {
//                Image(systemName: "line.3.horizontal.decrease.circle")
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding(10)
//        .background(Color.white)
//        .cornerRadius(10)
//        .padding(.horizontal)
//    }
//}
//
//struct FilterView: View {
//    @Binding var selectedCategory: CourseCategory?
//    @Environment(\.presentationMode) var presentationMode
//    @Environment(\.colorScheme) var colorScheme
//    
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                Text("აირჩიეთ კატეგორია")
//                    .font(.headline)
//                    .padding(.top)
//                
//                ScrollView {
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
//                        CategoryButton(title: "ყველა კურსი", isSelected: selectedCategory == nil) {
//                            selectedCategory = nil
//                            presentationMode.wrappedValue.dismiss()
//                        }
//                        
//                        ForEach(CourseCategory.allCases, id: \.self) { category in
//                            CategoryButton(title: category.rawValue, isSelected: selectedCategory == category) {
//                                selectedCategory = category
//                                presentationMode.wrappedValue.dismiss()
//                            }
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .navigationTitle("კურსები")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing: Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }) {
//                Image(systemName: "xmark.circle.fill")
//                    .foregroundColor(.gray)
//            })
//        }
//        .accentColor(colorScheme == .dark ? .white : .black)
//    }
//}
//
//struct CategoryButton: View {
//    let title: String
//    let isSelected: Bool
//    let action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .font(.subheadline)
//                .fontWeight(.medium)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(isSelected ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
//                .foregroundColor(isSelected ? .blue : .primary)
//                .cornerRadius(10)
//        }
//    }
//}


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
