//
//  CountriesNetworkService.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class WeatherNetworkService {
    
    public let requestService: DataNetworkRequestServiceType
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q="
    private let apiOptions = "&units=metric&appid=b581214660a55dc1348f6e109cac1104"
    
    private let parser = Parser()
    
    init(requestService: DataNetworkRequestServiceType) {
        self.requestService = requestService
    }
    
    public func scheduledTask(country: Country) -> NetworkTask {
        
        let rewriteWeather: (Weather) -> () = {
            country.weather = $0
        }
        
        let city = country.capitalName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let stringUrl = city.map { self.baseUrl + $0 + self.apiOptions }
        let url = stringUrl.flatMap(URL.init)
        
        guard let baseUrl = url else { return NetworkTask.canceled()}
        
        return self.requestService.scheduledTask(url: baseUrl) { result in
            let result = result.mapValue(self.parser.weather).value
            _ = result?.mapValue(rewriteWeather)
        }
    }
}
