//
//  Parse.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Parser {
    
    typealias ParserResultType<Model> = Result<Model, ParserError>
    
    enum ParserError: Error {
        case parseFailed
    }
    
    public func country(data: Data) -> ParserResultType<Country> {
        return self.model(data: data, parser: self.country)
    }
    
    public func weather(data: Data) -> ParserResultType<Weather> {
        return self.model(data: data, parser: self.weather)
    }
    
    public func countries(data: Data) -> ParserResultType<[Country]> {
        return self.model(data: data, parser: self.countries)
    }
    
    private func country(json: CountryJSON) -> Country {
        return Country(name: json.name, capitalName: json.capital)
    }
    
    private func weather(json: WeatherJSON) -> Weather {
        let main = json.main
        
        return Weather(
            temperatue: main.temp.int,
            humidity: main.humidity,
            clouds: json.clouds.all,
            windSpeed: json.wind.speed.int,
            cityName: json.name,
            date: json.dt
        )
    }
    
    private func countries(jsons: [CountryJSON]) -> [Country] {
        return jsons.map(self.country)
    }
    
    private func model<json: Decodable, Model>(data: Data?, parser: @escaping (json) -> Model) -> Result<Model, ParserError> {
        let model = data
            .flatMap { try? JSONDecoder().decode(json.self, from: $0) }
            .map(parser)
        
        return Result(
            value: model,
            error: .parseFailed,
            default: .parseFailed
        )
    }
}
