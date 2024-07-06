//
//  FilterView.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedCategory: Int?
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    let categories = [
        (id: 1, name: "განათლება"),
        (id: 2, name: "გართობა"),
        (id: 3, name: "ახალი ამბები"),
        (id: 4, name: "სხვა")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("აირჩიეთ კატეგორია")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        CategoryButton(title: "ყველა კურსი", isSelected: selectedCategory == nil) {
                            selectedCategory = nil
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        ForEach(categories, id: \.id) { category in
                            CategoryButton(title: category.name, isSelected: selectedCategory == category.id) {
                                selectedCategory = category.id
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("კურსები")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            })
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}
