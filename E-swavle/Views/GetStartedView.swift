//
//  GetStartedView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct GetStartedView: View {
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("astronaut")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340, height: 470)
                    
                    Text("E-სწავლე")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink(value: navigateToLogin) {
                        Button(action: {
                            self.navigateToLogin = true
                        }) {
                            HStack {
                                Text("დაწყება")
                                    .font(.system(size: 18, weight: .bold))
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25)
                        }
                    }
                    .navigationDestination(isPresented: $navigateToLogin) {
                        LogInView()
                    }
                    
                    Spacer()
                        .frame(height: 150)
                }
                
                Image("galaxy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .position(x: 50, y: 50)
                
                Image("planet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 50)
            }
        }
    }
}

#Preview {
    GetStartedView()
}
