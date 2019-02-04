//
//  CountriesManager.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesManager {
    
    private let baseUrl = "https://restcountries.eu/rest/v2/all"
    
    private let requestService: RequestService<[CountryJSON]>
    private let parser = Parser()
    
    init(requestService: RequestService<[CountryJSON]>) {
        self.requestService = requestService
    }
    
    public func getCountries(model: DataModels) {
        let baseUrl = URL(string: self.baseUrl)
        
        guard let url = baseUrl else { return }
        
        self.requestService.loadData(url: url) { countries, error in
            let countriesData = countries?.map { self.parser.country(from: $0) }
            countriesData?.forEach { model.append(country: $0) }
        }
    }
}


