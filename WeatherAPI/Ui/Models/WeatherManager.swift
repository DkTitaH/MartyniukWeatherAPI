//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WeatherManager: ObservableObject<(Weather?, Error?)> {
    
    private(set) var weather: Weather?
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    private let apiOptions = "&units=metric&appid=b581214660a55dc1348f6e109cac1104"
    
    private let networkManager = RequestService<WeatherJSON>()
    
    public func getWeatherData(city: String) {
        let stringUrl = self.baseUrl + city + self.apiOptions
        let convertUrl = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = convertUrl.flatMap { URL(string: $0) }
        
        guard let baseUrl = url else { return }

        self.networkManager.loadData(url: baseUrl) { weather, error in
            let weatherData = weather.map { Weather(weatherJSON: $0) }
            self.weather = weatherData
            self.notify((weatherData,error))
        }
    }
}
