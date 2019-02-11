//
//  CountriesNetworkService.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class WeatherNetworkService: NetworkStateable {
    
    var status = NetworkState.idle
    
    public let requestService: RequestServiceType
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    private let apiOptions = "&units=metric&appid=b581214660a55dc1348f6e109cac1104"
    
    private let parser = Parser()
    
    init(requestService: RequestServiceType) {
        self.requestService = requestService
    }
    
    public func getWeather(country: Country) {
        let city = country.capitalName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let stringUrl = city.map { self.baseUrl + $0 + self.apiOptions }
        let url = stringUrl.flatMap(URL.init)
        
        guard let baseUrl = url else { return }
        
        self.requestService.loadData(url: baseUrl) { data, error in
            country.weather = self.parser.weather(data: data)
        }
    }
}
