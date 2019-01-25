//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WeatherManager {
    
//    public var completion: F.Completion<WeatherJSON>?
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    private let apiOptions = "&units=metric&appid=b581214660a55dc1348f6e109cac1104"

    private(set) var weather: Weather? = nil
    
    private let networkManager = NetworkManager<WeatherJSON>()
    
    init() {
//        _ = self.networkManager.observer { state in
//            switch state {
//            case .didLoad:
//                return
//                self.networkManager.model.do { self.completion?($0) }
//            default:
//                return
//            }
//        }
    }
    
    public func getWeatherData(city: String, completion: @escaping F.Completion<Weather>) {
        let stringUrl = self.baseUrl + city + self.apiOptions
        let convertUrl = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = convertUrl.flatMap { URL(string: $0) }
        
        let networkManager = self.networkManager
        
        guard let baseUrl = url else { return }

        networkManager.loadData(url: baseUrl) { weather, error in
            weather.do {
                print("getWeather")
                let weather = Weather(weatherJSON: $0)
                self.weather = weather

                completion(weather)
            }
        }
    }
}
