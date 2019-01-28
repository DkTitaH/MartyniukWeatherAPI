//
//  CountriesManager.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesManager: ObservableObject<([Country]?, Error?)> {
    
    private(set) var countries: [Country]?
    
    private let baseUrl = "https://restcountries.eu/rest/v2/all"
    
    private let networkManager = RequestService<[CountryJSON]>()
    
    override init() {
        super.init()
        self.getCountries()
    }
    
    public func getCountries() {
        let baseUrl = URL(string: self.baseUrl)
        
        guard let url = baseUrl else { return }
        
        self.networkManager.loadData(url: url) { countries, error in
            let countriesData = countries?.compactMap { Country(countryJSON: $0) }
            self.countries = countriesData
            self.notify((countriesData,error))
        }
    }
}
