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
    
    private(set) var countries: [Country]? = nil
    
    private let networkManager = NetworkManager<[CountryJSON]>()
    
    public func getCountries(completion: @escaping F.Completion<[Country]>) {
        let baseUrl = URL(string: self.baseUrl)
        
        let networkManager = self.networkManager
        
        guard let url = baseUrl else { return }

        networkManager.loadData(url: url) { countries, error in
            error.do { print($0) }
            countries.do {
                let countries = $0.map { Country(countryJSON: $0) }
                completion(countries)
            }
        }
    }
}
