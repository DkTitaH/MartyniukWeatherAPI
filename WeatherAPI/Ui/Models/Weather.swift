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
        let all: Int
    }
    
    struct Coord: Codable {
        let lon, lat: Double
    }
    
    struct Main: Codable {
        let temp: Double
        let pressure, humidity: Int
        let tempMin, tempMax: Double
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    struct Sys: Codable {
        let type, id: Int
        let message: Double
        let country: String
        let sunrise, sunset: Int
    }
    
    struct WeatherInfo: Codable {
        let id: Int
        let main, description, icon: String
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    let coord: Coord
    let weather: [WeatherInfo]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let id: Int
    let name: String
    let cod: Int
}
