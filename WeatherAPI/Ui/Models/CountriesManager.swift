//
//  CountriesManager.swift
//  WeatherAPI
//
//  Created by Student on 17.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CountriesManager: ObservableObject<(DataModels?, Error?)> {
    
    private(set) var model: DataModels?
    
    private let baseUrl = "https://restcountries.eu/rest/v2/all"
    
    private let networkManager = RequestService<[CountryJSON]>()
    
    override init() {
        super.init()
        self.getCountries()
    }
    
    private func getCountries() {
        let baseUrl = URL(string: self.baseUrl)
        
        guard let url = baseUrl else { return }
        
        self.networkManager.loadData(url: url) { countries, error in
            let countriesData = countries?.map { Country(countryJSON: $0) }
            let dataModels = countriesData?.map { DataModel(country: $0) }
            dataModels.do { self.model = DataModels.init(with: $0) }
            self.notify((self.model,error))
        }
    }
}
