//
//  Weather.swift
//  WeatherAPI
//
//  Created by Student on 24.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Weather {
    
    public let temperature: Int?
    public let humidity: Int?
    public let clouds: Int?
    public let windSpeed: Int?
    public let cityName: String?
    public let date: Int?
    
    init(weatherJSON: WeatherJSON) {
        let main = weatherJSON.main
        
        self.temperature = main?.temp.map { Int($0) }
        self.humidity = main?.humidity
        self.clouds = weatherJSON.clouds?.all
        self.windSpeed = weatherJSON.wind?.speed.map { Int($0) }
        self.cityName = weatherJSON.name
        self.date = weatherJSON.dt
    }
}
