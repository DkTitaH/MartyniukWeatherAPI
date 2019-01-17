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
    
    private let networkManager = NetworkManager<[Country]>()
    
    var completion: F.Completion<[Country]>?
    
    init() {
        _ = networkManager.observer { state in
            switch state {
            case .didLoad:
                self.networkManager.model.do { self.completion?($0) }
            default:
                return
            }
        }
    }
    
    func getCountries() {
        let baseUrl = URL(string: self.baseUrl)
        
        let networkManager = self.networkManager
        
        baseUrl.do { networkManager.loadData(url: $0) }
        networkManager.model.do { self.completion?($0) }
    }
}
