//
//  SignUpView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToHome = false
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    @State private var doPasswordsMatch = true

    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("რეგისტრაცია")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("E-მეილი")
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                        
                        TextField("", text: $email)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        if !isEmailValid {
                            Text("არასწორი E-მეილი ფორმატი")
                                .foregroundColor(.red)
                                .padding(.leading, 25)
                        }
                        
                        Text("პაროლი")
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                        
                        SecureField("", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                        
                        if !isPasswordValid {
                            Text("პაროლი უნდა შეიცავდეს მინიმუმ 8 სიმბოლოს")
                                .foregroundColor(.red)
                                .padding(.leading, 25)
                        }
                        
                        Text("დაადასტურეთ პაროლი")
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                        
                        SecureField("", text: $confirmPassword)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                        
                        if !doPasswordsMatch {
                            Text("პაროლები არ ემთხვევა")
                                .foregroundColor(.red)
                                .padding(.leading, 25)
                        }
                    }
                    
                    Button(action: validateAndNavigate) {
                        Text("რეგისტრაცია")
                            .foregroundColor(.black)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 70)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(25)
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToHome) {
                TabBarView().navigationBarBackButtonHidden(true)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }
    
    private var backgroundColor: some View {
        Color(.myPurple)
            .ignoresSafeArea()
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
                .imageScale(.large)

        }
    }
    
    private func validateAndNavigate() {
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

#Preview {
    SignUpView()
}
