//
//  Country.swift
//  WeatherAPI
//
//  Created by Student on 24.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Country {
    
    public let name: String
    public let capitalName: String
    public var weather: Weather? = nil
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalName = capitalName
    }
}
