//
//  Country.swift
//  WeatherAPI
//
//  Created by Student on 24.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Country: ObservableObject<Country.Event> {
    
    public enum Event {
        case didChangeWeather(Weather?)
    }
    
    public let name: String
    public let capitalName: String
    public var weather: Weather? {
        didSet {
            self.notify(.didChangeWeather(self.weather))
        }
    }
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalName = capitalName
    }
}
