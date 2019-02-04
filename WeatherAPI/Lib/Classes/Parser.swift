//
//  Parser.swift
//  WeatherAPI
//
//  Created by Student on 01.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Parser {
    
    public func weather(from weatherJSON: WeatherJSON) -> Weather {
        let main = weatherJSON.main
        
        return Weather(
            temperatue: main?.temp.map { Int($0) },
            humidity: main?.humidity,
            clouds: weatherJSON.clouds?.all,
            windSpeed: weatherJSON.wind?.speed.map { Int($0) },
            cityName: weatherJSON.name,
            date: weatherJSON.dt
        )
    }
    
    public func country(from countryJSON: CountryJSON) -> Country {
        return Country(name: countryJSON.name, capitalName: countryJSON.capital)
    }
}
