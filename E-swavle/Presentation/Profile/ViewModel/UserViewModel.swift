//
//  UserViewModel.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import Foundation
import myNetworkPackage

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    private let networkService = NetworkService()
    
    func fetchUserData() {
        networkService.getData(urlString: "http://18.199.247.115:8080/api/User/4") { (result: Result<User, Error>) in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    
    var userLevel: String {
        switch user?.level {
        case 0:
            return "Junior"
        case 1:
            return "Middle"
        case 2:
            return "Senior"
        default:
            return "Unknown"
        }
    }
    
    var gender: String {
        user?.gender == false ? "Female" : "Male"
    }
}
