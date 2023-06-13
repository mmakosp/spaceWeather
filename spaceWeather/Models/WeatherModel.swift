//
//  WeatherModel.swift
//  spaceWeather
//
//  Created by Mmako Sekhosana on 2023/06/12.
//

import Foundation

struct WeatherModel: Codable {
    let forecasts: [ForecastModel]
    let lastUpdated: String
    let weatherStation: String
}

struct ForecastModel: Codable {
    let date: String
    let temp: Double
    let humidity: Int
    let windSpeed: Int
    let safe: Bool
}
