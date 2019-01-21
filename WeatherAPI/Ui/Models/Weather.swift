//
//  Weather.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    struct Clouds: Codable {
        let all: Int?
    }
    
    struct Coord: Codable {
        let lon: Double?
        let lat: Double?
    }
    
    struct Main: Codable {
        let temp: Double?
        let pressure: Int?
        let humidity: Int?
        let tempMin: Double?
        let tempMax: Double?
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    struct Sys: Codable {
        let type: Int?
        let id: Int?
        let message: Double?
        let country: String?
        let sunrise: Int?
        let sunset: Int?
    }
    
    struct WeatherInfo: Codable {
        let id: Int?
        let main: String?
        let description: String?
        let icon: String?
    }
    
    struct Wind: Codable {
        let speed: Double?
        let deg: Int?
    }
    
    let coord: Coord?
    let weather: [WeatherInfo?]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let id: Int?
    let name: String?
    let cod: Int?
}
