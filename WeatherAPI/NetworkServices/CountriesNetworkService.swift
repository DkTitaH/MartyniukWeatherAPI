//
//  WeatherNetworkService.swift
//  WeatherAPI
//
//  Created by Student on 06.02.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class CountriesNetworkService: NetworkStateable {
    
    var status = NetworkState.idle
    
    private let baseUrl = "https://restcountries.eu/rest/v2/all"
    
    private let requestService: RequestService
    private let parser = Parser()
    
    init(requestService: RequestService) {
        self.requestService = requestService
    }
    
    public func getCountries(model: Countries) {
        let baseUrl = URL(string: self.baseUrl)
        
        guard let url = baseUrl else { return }
        
        self.requestService.loadData(url: url) { data, error in
            let countries = self.parser.countries(data: data)
            countries.map(model.rewrite)
        }
    }
}
