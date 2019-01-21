//
//  DataModel.swift
//  WeatherAPI
//
//  Created by Student on 21.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class DataModel {
    var weather: Weather?
    var country: Country
    
    init(country: Country, weather: Weather? = nil) {
        self.country = country
        self.weather = weather
    }
}
