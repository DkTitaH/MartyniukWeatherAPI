//
//  DataModels.swift
//  WeatherAPI
//
//  Created by Student on 29.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Countries: ObservableObject<Countries.DataModelEvents> {
    
    enum DataModelEvents {
        case didRemove(Country)
        case didRewritedCountries([Country])
        case didAppendCountry(Country)
    }
    
    private var values = [Country]()
    
    public var count: Int {
        return self.values.count
    }
    
    subscript(index: Int) -> Country {
        return self.values[index]
    }
    
    public func append(country: Country) {
        self.values.append(country)
        self.notify(.didAppendCountry(country))
    }
    
    public func rewrite(with countries: [Country]) {
        self.values = countries
        self.notify(.didRewritedCountries(self.values))
    }
    
    public func remove(index: Int) {
        self.values.remove(at: index)
    }
}
