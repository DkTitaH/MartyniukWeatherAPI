//
//  Parser.swift
//  WeatherAPI
//
//  Created by Student on 01.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Parser {
    
    public func country(data: Data?) -> Country? {
        return self.model(data: data, parser: self.country)
    }
    
    public func weather(data: Data?) -> Weather? {
        return self.model(data: data, parser: self.weather)
    }
    
    public func countries(data: Data?) -> [Country]? {
        return self.model(data: data, parser: self.countries)
    }
    
    private func country(json: CountryJSON) -> Country {
        return Country(name: json.name, capitalName: json.capital)
    }
    
    private func weather(json: WeatherJSON) -> Weather {
        let main = json.main
        
        return Weather(
            temperatue: main?.temp.map { Int($0) },
            humidity: main?.humidity,
            clouds: json.clouds?.all,
            windSpeed: json.wind?.speed.map { Int($0) },
            cityName: json.name,
            date: json.dt
        )
    }
    
    private func countries(jsons: [CountryJSON]) -> [Country] {
        return jsons.map(self.country)
    }
    
    private func model<JSON: Decodable, Model>(data: Data?, parser: (JSON) -> Model) -> Model? {
        return data
            .flatMap { try? JSONDecoder().decode(JSON.self, from: $0) }
            .map(parser)
    }
}
