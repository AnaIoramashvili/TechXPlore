//
//  CourseCard.swift
//  E-swavle
//
//  Created by Ana on 7/6/24.
//

import SwiftUI

struct CourseCard: View {
    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AsyncImage(url: URL(string: course.thumbnailURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(course.title)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)

            Text(course.author)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .lineLimit(1) 
        }
        .frame(width: 160, height: 180)
        .padding(8)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
