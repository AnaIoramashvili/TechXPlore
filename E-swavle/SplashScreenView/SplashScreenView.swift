//
//  SplashScreenView.swift
//  E-swavle
//
//  Created by Ana on 7/4/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            GetStartedView()
        } else {
            VStack {
                Image("starship")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 500)  
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.myPurple)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
