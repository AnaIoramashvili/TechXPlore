//
//  CourseViewModel.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import Foundation
import myNetworkPackage

class CourseViewModel: ObservableObject {
    @Published var courses: [Course] = []
    @Published var errorMessage: String?
    private let networkService = NetworkService()
    
    func fetchCourses() {
        let urlString = "http://18.199.247.115:8080/api/Topic"
        
        networkService.getData(urlString: urlString) { [weak self] (result: Result<[Course], Error>) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedCourses):
                    self.courses = fetchedCourses
                    print("Successfully fetched \(fetchedCourses.count) courses")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("Error fetching courses: \(error)")
                }
            }
        }
    }
}
