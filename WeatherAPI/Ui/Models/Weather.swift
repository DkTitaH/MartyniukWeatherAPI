//
//  Weather.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let main: [String : Double]?
    let wind: [String : Double]?
    let clouds: [String : Int]?
}

struct WeatherData {
    let icon: String?
}
