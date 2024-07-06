//
//  SignUpViewModel.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isEmailValid = true
    @Published var isPasswordValid = true
    @Published var doPasswordsMatch = true
    @Published var navigateToHome = false
    
    func validateAndNavigate() {
        isEmailValid = isValidEmail(email)
        isPasswordValid = password.count >= 8
        doPasswordsMatch = password == confirmPassword
        
        if isEmailValid && isPasswordValid && doPasswordsMatch {
            navigateToHome = true
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
