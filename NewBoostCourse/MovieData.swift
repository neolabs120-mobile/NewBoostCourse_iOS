//
//  MovieData.swift
//  NewBoostCourse
//
//  Created by kimtaeuk on 2022/06/20.
//

import Foundation

// MARK: - Welcome
struct MovieData: Codable {
    let movies: [Movie]
    let orderType: Int

    enum CodingKeys: String, CodingKey {
        case movies
        case orderType = "order_type"
    }
}

// MARK: - Movie
struct Movie: Codable, Identifiable {
    let thumb: String
    let grade: Int
    let title: String
    let reservationGrade: Int
    let id: String
    let reservationRate: Double
    let date: String
    let userRating: Double

    enum CodingKeys: String, CodingKey {
        case thumb, grade, title
        case reservationGrade = "reservation_grade"
        case id
        case reservationRate = "reservation_rate"
        case date
        case userRating = "user_rating"
    }
}
