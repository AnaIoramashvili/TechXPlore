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
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: course.thumbnailURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 140, height: 100 )
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(String(course.title.prefix(15)) + (course.title.count > 15 ? "..." : ""))
                .font(.system(size: 12, weight: .semibold))
                .lineLimit(2)

            Text(course.author)
                .font(.system(size: 10))
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(width: 150, height: 160)
        .padding(8)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
