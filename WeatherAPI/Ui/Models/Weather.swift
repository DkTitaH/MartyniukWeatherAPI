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
    
    init(temperatue: Int?, humidity: Int?, clouds: Int?, windSpeed: Int?, cityName: String?, date: Int?) {
        self.temperature = temperatue
        self.humidity = humidity
        self.clouds = clouds
        self.windSpeed = windSpeed
        self.cityName = cityName
        self.date = date
    }
}
