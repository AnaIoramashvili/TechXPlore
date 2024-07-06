//
//  LeaderBoardViewModel.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import Foundation
import myNetworkPackage

class LeaderBoardViewModel: ObservableObject {
    @Published var users: [User] = []
    private let networkService = NetworkService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        networkService.getData(urlString: "http://18.199.247.115:8080/api/User") { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = users.sorted { $0.points > $1.points }
            case .failure(let error):
                print("Failed to fetch users: \(error.localizedDescription)")
            }
        }
    }
}

