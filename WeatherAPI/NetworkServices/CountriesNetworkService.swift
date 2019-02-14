//
//  WeatherNetworkService.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class CountriesNetworkService {
    
    typealias ReturnedData = Countries
    
    private let baseUrl = "https://restcountries.eu/rest/v2/all"
    
    private let requestService: DataNetworkRequestServiceType
    private let parser = Parser()
    
    init(requestService: DataNetworkRequestServiceType) {
        self.requestService = requestService
    }
    
    func scheduledTask(model: Countries) -> NetworkTask {
        let baseUrl = URL(string: self.baseUrl)
        
        guard let url = baseUrl else { return .canceled() }
        
        return self.requestService.scheduledTask(url: url) { result in
            let result = result.mapValue(self.parser.countries).value
            result?.value.do {
                model.rewrite(with: $0)
            }
        }
    }
}
