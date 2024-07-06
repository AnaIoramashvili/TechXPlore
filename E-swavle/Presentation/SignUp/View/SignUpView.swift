//
//  SignUpView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = SignUpViewModel()

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
                        
                        Text("დაადასტურეთ პაროლი")
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                        
                        SecureField("", text: $viewModel.confirmPassword)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                        
                        if !viewModel.doPasswordsMatch {
                            Text("პაროლები არ ემთხვევა")
                                .foregroundColor(.red)
                                .padding(.leading, 25)
                        }
                    }
                    
                    Button(action: viewModel.validateAndNavigate) {
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
            .navigationDestination(isPresented: $viewModel.navigateToHome) {
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
}


#Preview {
    SignUpView()
}
