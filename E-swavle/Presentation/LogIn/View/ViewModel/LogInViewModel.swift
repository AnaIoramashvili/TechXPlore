//
//  LogInViewModel.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isEmailValid = true
    @Published var isPasswordValid = true
    @Published var navigateToHome = false
    
    func validateInputs() {
        isEmailValid = isValidEmail(email)
        isPasswordValid = password.count >= 8
        
        if isEmailValid && isPasswordValid {
            navigateToHome = true
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
