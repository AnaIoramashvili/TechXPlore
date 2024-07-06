//
//  LogInView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct LogInView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToSignUp = false

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
                        
                        TextField("", text: $viewModel.email)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        if !viewModel.isEmailValid {
                            Text("არასწორი E-მეილი ფორმატი")
                                .foregroundColor(.red)
                                .padding(.leading, 25)
                        }
                        
                        Text("პაროლი")
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                        
                        SecureField("", text: $viewModel.password)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                        
                        if !viewModel.isPasswordValid {
                            Text("პაროლი უნდა შეიცავდეს მინიმუმ 8 სიმბოლოს")
                                .foregroundColor(.red)
                                .padding(.leading, 25)
                        }
                    }
                    
                    Button(action: viewModel.validateInputs) {
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
            .navigationDestination(isPresented: $viewModel.navigateToHome) {
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
}

#Preview {
    LogInView()
}


#Preview {
    LogInView()
}
