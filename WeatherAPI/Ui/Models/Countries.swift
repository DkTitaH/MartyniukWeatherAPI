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
        case didAppend(Country)
    }
    
    private var values = [Country]()
    
    public var count: Int {
        return self.values.count
    }
    
    subscript (index: Int) -> Country {
        return self.values[index]
    }
    
    public func append(country: Country) {
        self.values.append(country)
        self.notify(.didAppend(country))
    }
    
    public func remove(index: Int) {
        self.values.remove(at: index)
    }
}
