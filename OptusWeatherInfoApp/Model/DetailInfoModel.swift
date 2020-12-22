//
//  DetailInfoModel.swift
//  OptusWeatherApp
//
//  Created by Sachin on 21/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation

// MARK: - DetailInfoModel
struct DetailInfoModel: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind?
    let clouds: Clouds
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    let base: String
    let visibility: Int?
    let rain: Rain?
    let dt: Int
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double
    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}



