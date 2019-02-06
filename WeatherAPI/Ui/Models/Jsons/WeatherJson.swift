//
//  WeatherJson.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct WeatherJSON: Codable {
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Main: Codable {
        let temp: Double
        let pressure: Int
        let humidity: Int
        let tempMin: Double
        let tempMax: Double
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let name: String
}
