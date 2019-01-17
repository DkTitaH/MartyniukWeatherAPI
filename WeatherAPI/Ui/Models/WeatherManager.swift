//
//  WeatherData.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class WeatherModel {
    var weather: Weather? = nil
    var country: Country? = nil
}

class WeatherManager {
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    private let apiOptions = "&units=metric&APPID=b581214660a55dc1348f6e109cac1104"

    private let networkManager = NetworkManager<Weather>()
    
    var completion: F.Completion<Weather>?
    
    init() {
        _ = self.networkManager.observer { state in
            switch state {
            case .didLoad:
                self.networkManager.model.do { self.completion?($0) }
            default:
                return
            }
        }
    }
    
    func getWeatherData(city: String) {
        let stringUrl = self.baseUrl + city + self.apiOptions
        let convertUrl = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = convertUrl.flatMap { URL(string: $0) }
        
        let networkManager = self.networkManager
        
        url.do { networkManager.loadData(url: $0) }
        networkManager.model.do { self.completion?($0) }
    }
}
