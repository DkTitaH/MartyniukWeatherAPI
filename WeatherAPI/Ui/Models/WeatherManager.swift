//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WeatherManager {
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    private let apiOptions = "&units=metric&appid=b581214660a55dc1348f6e109cac1104"
    
    private let requestService: RequestService<WeatherJSON>
    private let parser = Parser()
    
    init(requestService: RequestService<WeatherJSON>) {
        self.requestService = requestService
    }
    
    public func getWeatherData(model: Wrapper<Country>) {
        let stringUrl = self.baseUrl + model.value.capitalName + self.apiOptions
        let convertUrl = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = convertUrl.flatMap { URL(string: $0) }
        
        guard let baseUrl = url else { return }

        self.requestService.loadData(url: baseUrl) { weather, error in
            let weatherData = weather.map { self.parser.weather(from: $0) }
            model.update {
                $0.weather = weatherData
            }
        }
    }
}


