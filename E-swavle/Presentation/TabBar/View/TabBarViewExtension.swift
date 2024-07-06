//
//  TabBarViewExtension.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import SwiftUI

extension TabBarView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
        }
        .frame(minWidth: 60, idealWidth: isActive ? 150 : 60)
        .padding(isActive ? 10 : 0)
        .background(isActive ? Color.purple.opacity(0.6) : .clear)
        .cornerRadius(30)
    }
}
