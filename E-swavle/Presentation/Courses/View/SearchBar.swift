//
//  SearchBar.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var onFilterTap: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("მოძებნე კურსები", text: $searchText)
            Spacer()
            Button(action: onFilterTap) {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundColor(.gray)
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
