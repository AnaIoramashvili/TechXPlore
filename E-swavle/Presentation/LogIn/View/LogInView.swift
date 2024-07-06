//
//  LogInView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct LogInView: View {
    @State private var navigateToHome = false
    @State private var navigateToSignUp = false
    @State private var email = ""
    @State private var password = ""
    @State private var isEmailValid = true
    @State private var isPasswordValid = true

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.myPurple)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("მოგესალმებით!")
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
                    }
                    
                    Button(action: validateInputs) {
                        Text("შესვლა")
                            .foregroundColor(.black)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 70)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(25)
                    }
                    .padding(.top, 30)
                    
                    Spacer()

                    
                    HStack {
                        Text("არ გაქვს ექაუნთი?")
                            .foregroundColor(.white)
                        
                        Button(action: { navigateToSignUp = true }) {
                            Text("დარეგისტრირდი")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 60)
                }
            }
            .navigationDestination(isPresented: $navigateToHome) {
                TabBarView()
                    .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $navigateToSignUp) {
                SignUpView()
                    .navigationBarBackButtonHidden(true)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func validateInputs() {
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


#Preview {
    LogInView()
}
